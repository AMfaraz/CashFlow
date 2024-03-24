import './db_handler.dart';
import '../model/customer_model.dart';

class CustomerHandler {
  final DbHandler _dbh = DbHandler();

  Future<CustomerModel> getCustomer(int customerId) async {
    var _result = await _dbh
        .readData("Customers", where: 'custId = ?', whereArgs: [customerId]);
    CustomerModel customer = CustomerModel.fromMap(_result);
    return customer;
  }


  updateData(Map<String,dynamic> newData,String where,List<dynamic> whereArgs)async {
    _dbh.updateData("Customers", newData, where, whereArgs);
    
  }


  //getting current password
  Future<String> _getCurrentCustomerPassword() async {
    int custId = CustomerModel.logedInCustomer.custId;
    var _result = await _dbh
        .readData("Customers", where: 'custId = ?', whereArgs: [custId]);
    return _result[0]["password"];
  }


  Future<bool> changeCurrentCustomerPassword(
      String oldPassword, String newPassword) async {
    int custId = CustomerModel.logedInCustomer.custId;

    String currentPassword = await _getCurrentCustomerPassword();
    if (oldPassword != currentPassword) {
      return false;
    }

    //checking for error
    try {
      updateData({"password":newPassword}, "custId = ? ", [custId]);
          return true;
    } on Exception catch (e) {
      // TODO
      return false;
    }
  }

  //email change
  Future<bool> changeCurrentCustomerEmail(
      String oldEmail, String newEmail) async {
    int custId = CustomerModel.logedInCustomer.custId;

    String currentPassword = await _getCurrentCustomerPassword();
    if (oldEmail != currentPassword) {
      return false;
    }

    //checking for error
    try {
      updateData({"email":newEmail}, "custId = ? ", [custId]);
          return true;
    } on Exception catch (e) {
      // TODO
      return false;
    }
  }
}
