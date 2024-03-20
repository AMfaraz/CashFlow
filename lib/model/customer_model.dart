class CustomerModel {
  static late CustomerModel logedInCustomer;

  final int custId;
  final String firstName;
  final String lastName;
  final String address;
  final String email;
  final String phoneNumber;
  final String cnic;

  CustomerModel({
    required this.custId,
    required this.firstName,
    required this.lastName,
    required this.address,
    required this.email,
    required this.phoneNumber,
    required this.cnic,
  });

  static convert(
    List<Map<String, dynamic>> customerData,
  ) {
    List<dynamic> list=[];
    list.addAll(customerData[0].values);
    // List.generate(customerData.length, (i) {
      
    //     customerData[i]["custId"];
    //     customerData[i]["firstName"];
    //     customerData[i]["lastName"];
    //     customerData[i]["address"];
    //     customerData[i]["email"];
    //     customerData[i]["phoneNumber"];
    //     customerData[i]["cnic"];
     
    // });

    return list;
  }

  static void setCurrentCustomer(List<Map<String, dynamic>> customer) {
    var list = convert(customer);
    logedInCustomer = CustomerModel(
        custId: list[0],
        firstName: list[1],
        lastName: list[2],
        address: list[2],
        email: list[3],
        phoneNumber: list[4],
        cnic: list[5]);
  }
}
