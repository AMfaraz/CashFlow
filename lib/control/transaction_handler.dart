import './db_handler.dart';
import '../model/transaction_model.dart';
import './customer_handler.dart';
import './account_handler.dart';
import '../model/customer_model.dart';
import 'package:cash_flow/model/account_model.dart';

class TransactionHandler {
  final DbHandler _dbh = DbHandler();
  final AccountHandler _ach = AccountHandler();

  Future<bool> addTransaction({
    required int amount,
    required String accountId,
    required String recieverId,
    String? bank = "anbank",
    String? name = "randomName",
  }) async {
    //if not enough money
    if (AccountModel.currentAccount.balance < amount) {
      return false;
    }

    //generating id
    String id = await _dbh.generateTransactionId(accountId);

    //getting customer's info
    var values = TransactionModel.transactionMap(
        transactionId: id,
        amount: amount,
        accountId: accountId,
        recieverId: recieverId,
        name: name!,
        bank: bank);
    AccountModel? recieverAccount;
    CustomerModel? reciever;

    if (bank == "Cash Flow") {
      recieverAccount = await AccountHandler().getAccount(recieverId);
      reciever = await CustomerHandler().getCustomer(recieverAccount.custId);

      values = TransactionModel.transactionMap(
        amount: amount,
        accountId: accountId,
        recieverId: recieverId,
        transactionId: id,
        name: reciever.firstName,
        bank: bank,
      );
    }

    try {
      //inserting data
      await DbHandler().insertData("Transactions", values);


      int newbalance = AccountModel.currentAccount.balance - amount;
      AccountModel.currentAccount.balance = newbalance;

      //updating current account
      _ach.updateData({"balance": newbalance}, "accountId = ?", [accountId]);

      //adding money to other person's account
      if (bank == "Cash Flow") {
        AccountModel otherAccount = await _ach.getAccount(recieverId);
        _ach.updateData({"balance": newbalance + otherAccount.balance},
            "accountId = ?", [recieverId]);
      }

      return true;
    } on Exception catch (e) {
      // TODO
      print(e);
      return false;
    }
  }

  static setAllTransactions(String accountId) async {
    //reading all transactions to be added to list
      var _result = await DbHandler().readData("Transactions",
          where: 'accountId = ?', whereArgs: [accountId]);
      TransactionModel.addToList(_result);
  }
}
