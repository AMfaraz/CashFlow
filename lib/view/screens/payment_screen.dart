import 'package:flutter/material.dart';

import 'package:cash_flow/view/utils/colors.dart';
import '../utils/text_theme.dart' as th;
import '../utils/screen_utils.dart';
import '../utils/screen_utils.dart';
import '../widgets/payment_type.dart';

class PaymentScreen extends StatelessWidget {
  const PaymentScreen({super.key});

  @override
  Widget build(BuildContext context) {
    double height = ScreenUtils.height(context);
    double width = ScreenUtils.width(context);

    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: secondaryColor,
          title: Text("Home"),
          actions: [
            Container(
                margin: const EdgeInsets.only(top: 10, right: 10),
                child: const Icon(Icons.mobile_friendly))
          ],
        ),
        body: Container(
          color: primaryColor,
          width: double.infinity,
          child: const Column(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: <Widget>[
              Text("Image"),

              //bill payment mobile recharge
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: <Widget>[
                  PaymentType(
                      imgSrc:
                          'https://www.shutterstock.com/shutterstock/photos/741444880/display_1500/stock-vector-invoice-line-icon-payment-and-bill-invoice-order-symbol-concept-tax-sign-design-paper-bank-741444880.jpg',
                      imgText: "Bill \nPayment"),
                  PaymentType(
                      imgSrc:
                          'https://www.shutterstock.com/shutterstock/photos/741444880/display_1500/stock-vector-invoice-line-icon-payment-and-bill-invoice-order-symbol-concept-tax-sign-design-paper-bank-741444880.jpg',
                      imgText: "Mobile \nRecharge"),
                ],
              ),


              //CreditCard Loan Repayment
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: <Widget>[
                  PaymentType(
                      imgSrc:
                          'https://www.shutterstock.com/shutterstock/photos/741444880/display_1500/stock-vector-invoice-line-icon-payment-and-bill-invoice-order-symbol-concept-tax-sign-design-paper-bank-741444880.jpg',
                      imgText: "Credit \nCard"),
                  PaymentType(
                      imgSrc:
                          'https://www.shutterstock.com/shutterstock/photos/741444880/display_1500/stock-vector-invoice-line-icon-payment-and-bill-invoice-order-symbol-concept-tax-sign-design-paper-bank-741444880.jpg',
                      imgText: "Loan \nRepayment"),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}