import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

import '../utils/colors.dart';
import '../widgets/payment_type.dart';
import './company_electricity_screen.dart';
import './company_gas_services.dart';
import './company_water_screen.dart';

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
              Container(
                margin: EdgeInsets.all(15),
                height: 190,
                child: PaymentType(
                    imgSrc:
                        'https://www.shutterstock.com/shutterstock/photos/741444880/display_1500/stock-vector-invoice-line-icon-payment-and-bill-invoice-order-symbol-concept-tax-sign-design-paper-bank-741444880.jpg',
                    imgText: "Change Login Id"),
              ),
              Container(
                margin: EdgeInsets.all(15),
                height: 190,
                child: PaymentType(
                    imgSrc:
                        'https://www.shutterstock.com/shutterstock/photos/741444880/display_1500/stock-vector-invoice-line-icon-payment-and-bill-invoice-order-symbol-concept-tax-sign-design-paper-bank-741444880.jpg',
                    imgText: "Change Password"),
              )
            ],
          ),
        ),
      ),
    );
  }
}





















// 'https://www.shutterstock.com/shutterstock/photos/741444880/display_1500/stock-vector-invoice-line-icon-payment-and-bill-invoice-order-symbol-concept-tax-sign-design-paper-bank-741444880.jpg',
