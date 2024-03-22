// class CustomerModel {
//   static late CustomerModel logedInCustomer;

//   final int custId;
//   final String firstName;
//   final String lastName;
//   final String address;
//   final String email;
//   final String phoneNumber;
//   final String cnic;

//   CustomerModel({
//     required this.custId,
//     required this.firstName,
//     required this.lastName,
//     required this.address,
//     required this.email,
//     required this.phoneNumber,
//     required this.cnic,
//   });

//   static convert(
//     List<Map<String, dynamic>> customerData,
//   ) {
//     // List<dynamic> list=[];
//     // list.addAll(customerData[0].values);

//     // return list;

//     return customerData[0];
//   }

//   // static void setCurrentCustomer(List<Map<String, dynamic>> customer) {
//   //   var list = convert(customer);
//   //   logedInCustomer = CustomerModel(
//   //       custId: list[0],
//   //       firstName: list[1],
//   //       lastName: list[2],
//   //       address: list[3],
//   //       email: list[4],
//   //       phoneNumber: list[5],
//   //       cnic: list[6]);
//   // }

//   static void setCurrentCustomer(List<Map<String, dynamic>> customer) {
//     Map<String, dynamic> list = convert(customer);
//     logedInCustomer = CustomerModel(
//         custId: list["custId"],
//         firstName: list["firstName"],
//         lastName: list["lastName"],
//         address: list["address"],
//         email: list["email"],
//         phoneNumber: list["phoneNumber"],
//         cnic: list["cnic"]);
//   }

//   static toJason({
//     required String firstName,
//     required String lastName,
//     required String address,
//     required String email,
//     required String phoneNumber,
//     required String cnic,
//   }){

//   }
// }

import 'package:flutter/material.dart';

class CustomerModel {
  static late CustomerModel logedInCustomer;

  final int custId;
  final String firstName;
  final String lastName;
  final String address;
  final String email;
  final int phoneNumber;
  final int cnic;

  CustomerModel({
    required this.custId,
    required this.firstName,
    required this.lastName,
    required this.address,
    required this.email,
    required this.phoneNumber,
    required this.cnic,
  });

  static _convert(
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
  //       address: list[3],
  //       email: list[4],
  //       phoneNumber: list[5],
  //       cnic: list[6]);
  // }

  //converting from map
static CustomerModel fromMap(List<Map<String, dynamic>> customer){
  Map<String, dynamic> list = _convert(customer);
  return CustomerModel(
         custId: list["custId"],
        firstName: list["firstName"],
        lastName: list["lastName"],
        address: list["address"],
        email: list["email"],
        phoneNumber: list["phoneNumber"],
        cnic: list["cnic"]);
}


  //setting current customer
  static void setCurrentCustomer(List<Map<String, dynamic>> customer) {
    // Map<String, dynamic> list = _convert(customer);
    // logedInCustomer = CustomerModel(
    //     custId: list["custId"],
    //     firstName: list["firstName"],
    //     lastName: list["lastName"],
    //     address: list["address"],
    //     email: list["email"],
    //     phoneNumber: list["phoneNumber"],
    //     cnic: list["cnic"]);
    logedInCustomer=fromMap(customer);
  }

  //converting to map
  static Map<String, dynamic> customerMap({
    required String firstName,
    required String lastName,
    required String address,
    required String email,
    required int phoneNumber,
    required int cnic,
    required String password,
  }) {
    return {
      'password': password,
      'firstName': firstName,
      'lastName': lastName,
      'address': address,
      'email': email,
      'phoneNumber': phoneNumber,
      'cnic': cnic,
    };
  }

}
