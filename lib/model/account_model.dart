class AccountModel{
  AccountModel name=AccountModel();

  static late int custId;
  static late String firstName;
  static late String lastName;
  static late String address;
  static late String email;
  static late String phoneNumber;
  static late String cnic;

  static void convert(List<Map<String, dynamic>> customer){
    List.generate(customer.length, (i) {
        custId=customer[i]["custId"];
        firstName=customer[i]["firstName"];
        lastName=customer[i]["lastName"];
        address=customer[i]["address"];
        email=customer[i]["email"];
        phoneNumber=customer[i]["phoneNumber"];
        cnic=customer[i]["cnic"];
      }
    );
  }
}
