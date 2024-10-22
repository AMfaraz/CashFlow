import 'package:flutter/material.dart';

import '../utils/colors.dart';
import '../widgets/payment_type.dart';
import './passwird_change_screen.dart';
import './loginid_change_screen.dart';

class SettingScreen extends StatelessWidget {
  const SettingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: primaryColor,
        appBar: AppBar(
          title: const Text("Setting"),
          actions: [
            Container(
                margin: const EdgeInsets.only(top: 10, right: 10),
                child: const Icon(Icons.home_outlined))
          ],
          backgroundColor: secondaryColor,
        ),
        body: Container(
          color: primaryColor,
          width: double.infinity,
          // height: double.infinity,

          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: <Widget>[
              //change email screen
              Container(
                margin: EdgeInsets.all(15),
                height: 190,
                child: PaymentType(
                  imgSrc: 'assets/icons/loginId.png',
                  imgText: "Change Login Id",
                  func: () {
                    Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (context) {
                          return LoginIdChangeScreen();
                        },
                      ),
                    );
                  },
                ),
              ),

              //password change screen
              Container(
                margin: EdgeInsets.all(15),
                height: 190,
                child: PaymentType(
                  imgSrc: 'assets/icons/password.png',
                  imgText: "Change Password",
                  func: () {
                    Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (context) {
                          return PasswordChangeScreen();
                        },
                      ),
                    );
                  },
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}





















// 'https://www.shutterstock.com/shutterstock/photos/741444880/display_1500/stock-vector-invoice-line-icon-payment-and-bill-invoice-order-symbol-concept-tax-sign-design-paper-bank-741444880.jpg',
