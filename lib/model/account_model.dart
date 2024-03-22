import '../control/db_handler.dart';

class AccountModel{
  static late AccountModel currentAccount;

  final String accountId;
  int balance;
  final String type;
  final int custId;
 

  AccountModel({
    required this.accountId,
    required this.balance,
    required this.type,
    required this.custId,
  });

  static Map<String,dynamic> _convert(
    List<Map<String, dynamic>> customerData,
  ) {
    // List<dynamic> list=[];
    // list.addAll(customerData[0].values);

    // return list;

    return customerData[0];
  }

  // static void setCurrentCustomer(List<Map<String, dynamic>> customer) {
  //   var list = convert(customer);
  //   logedInCustomer = CustomerModel(
  //       custId: list[0],
  //       firstName: list[1],
  //       lastName: list[2],
  //       address: list[2],
  //       email: list[3],
  //       phoneNumber: list[4],
  //       cnic: list[5]);
  // }


//from json to Account
static AccountModel fromMap(List<Map<String, dynamic>> customer){
  Map<String, dynamic> list = _convert(customer);
  return AccountModel(
        accountId: list["accountId"],
        balance: list["balance"],
        type: list["type"],
        custId: list["custId"],);
}


  static void setCurrentAccount(List<Map<String, dynamic>> customer) {
    // Map<String, dynamic> list = _convert(customer);
    // currentAccount = AccountModel(
    //     accountId: list["accountId"],
    //     balance: list["balance"],
    //     type: list["type"],
    //     custId: list["custId"],);

    currentAccount=fromMap(customer);
  }


//to json
static Map<String, dynamic> accountMap({
    required String accountId,
    required int balance,
    required String type,
    required int custId,
  }) {
    return {
      'accountId': accountId,
      'balance': balance,
      'type': type,
      'custId': custId,
    };
}



}
