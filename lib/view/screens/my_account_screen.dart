import 'package:flutter/material.dart';

import '../utils/colors.dart';
import '../utils/text_theme.dart' as th;
import 'package:cash_flow/view/utils/screen_utils.dart';
import '../../model/customer_model.dart';
import '../../model/account_model.dart';

class MyAccountScreen extends StatelessWidget {
  const MyAccountScreen({super.key});

  @override
  Widget build(BuildContext context) {
    double height = ScreenUtils.height(context);

    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: const Text("My Account"),
          actions: [
            Container(
                margin: const EdgeInsets.only(top: 10, right: 10),
                child: const Icon(Icons.home_mini_outlined))
          ],
          backgroundColor: secondaryColor,
        ),
        body: Container(
          width: double.infinity,
          color: primaryColor,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            mainAxisSize: MainAxisSize.max,
            children: <Widget>[
              //image
              // Container(
              //   child: const Text("Image"),
              //   height: height * 0.4,
              // ),

              Container(
                child: Image.asset('assets/icons/logo.png'),
              ),

              //details
              Container(
                width: double.infinity,
                color: secondaryColor,
                padding: const EdgeInsets.only(top: 15, left: 15, right: 15,bottom: 30),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text(
                      "Name: ${CustomerModel.logedInCustomer.firstName} ${CustomerModel.logedInCustomer.lastName}",
                      style: th.TextTheme.heading.copyWith(color: primaryColor),
                    ),
                    Text(
                      "Phone Number: ${CustomerModel.logedInCustomer.phoneNumber}",
                      style: th.TextTheme.heading.copyWith(color: primaryColor),
                    ),
                    Text(
                      "Address: ${CustomerModel.logedInCustomer.address}",
                      style: th.TextTheme.heading.copyWith(color: primaryColor),
                    ),
                    Text(
                      "Account Number: ${AccountModel.currentAccount.accountId}",
                      style: th.TextTheme.heading.copyWith(color: primaryColor),
                    ),
                  ],
                ),
              ),
              Container(
                  color: Colors.grey,
                  width: double.infinity,
                  padding: EdgeInsets.all(15),
                  // margin: EdgeInsets.only(top: 15),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text("Current Balance (PKR)",style: th.TextTheme.heading,),
                      Text(AccountModel.currentAccount.balance.toString(),style: th.TextTheme.heading,),
                    ],
                  )),
            ],
          ),
        ),
      ),
    );
  }
}
