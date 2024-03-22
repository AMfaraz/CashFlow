import 'package:cash_flow/model/account_model.dart';

import './db_handler.dart';
import '../model/customer_model.dart';
import '../model/customer_model.dart';

class Auth {
  static Future<bool> login(String email, String password) async {
    var _result = await DbHandler().readData("Customers",
        where: 'email = ? AND password = ?', whereArgs: [email, password]);

    if (_result.isNotEmpty) {
      // succesfful setting login
      CustomerModel.setCurrentCustomer(_result);

      //setting the customer account
      var _accountData = await DbHandler().readData("Account",
          where: 'custId = ?',
          whereArgs: [CustomerModel.logedInCustomer.custId]);
      AccountModel.setCurrentAccount(_accountData);
    }

    return _result.isNotEmpty;
  }

//signin
  static Future<bool> signin({
    required String firstName,
    required String lastName,
    required String address,
    required String email,
    required int phoneNumber,
    required int cnic,
    required String password,
  }) async {
    bool result = false;
    int? id;
    Map<String, dynamic> values = CustomerModel.customerMap(
        firstName: firstName,
        lastName: lastName,
        address: address,
        email: email,
        phoneNumber: phoneNumber,
        cnic: cnic,
        password: password);

    try {
      id = await DbHandler().insertData("Customers", values);

      //if succesful
      var _result = await DbHandler()
          .readData("Customers", where: 'custId = ?', whereArgs: [id]);
      CustomerModel.setCurrentCustomer(_result);

      result = true;
    } on Exception catch (e) {
      result = false;
      // TODO
    }

    if (result) {
      String accountId = await DbHandler().generateAccountId();
      Map<String, dynamic> accountValues = {
        "accountId": accountId,
        "balance":10000,
        "custId":id,
      };
      await DbHandler().insertData("Account", accountValues);
      var _result = await DbHandler()
          .readData("Account", where: 'custId = ?', whereArgs: [id]);
      AccountModel.setCurrentAccount(_result);
    }

    return result;
  }
}
