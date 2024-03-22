import './db_handler.dart';
import '../model/customer_model.dart';


class CustomerHandler {
  final DbHandler _dbh = DbHandler();

  Future<CustomerModel> getCustomer(int customerId) async {
    var _result = await _dbh.readData("Customers", where: 'custId = ?', whereArgs: [customerId]);
    CustomerModel customer = CustomerModel.fromMap(_result);
    return customer;
  }
}