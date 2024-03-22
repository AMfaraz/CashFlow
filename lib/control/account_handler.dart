import './db_handler.dart';
import '../model/account_model.dart';

class AccountHandler{
  final DbHandler _dbh = DbHandler();


  Future<AccountModel> getAccount(String accountId)async {
    var _result = await _dbh
          .readData("Account", where: 'accountId = ?', whereArgs: [accountId]);
    AccountModel account=AccountModel.fromMap(_result);
    return account;
  }

  updateData(Map<String,dynamic> newData,String where,List<dynamic> whereArgs)async {
    _dbh.updateData("Account", newData, where, whereArgs);
    
  }
}