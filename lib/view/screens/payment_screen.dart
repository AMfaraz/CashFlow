import 'package:flutter/material.dart';

import 'package:cash_flow/view/utils/colors.dart';
import '../utils/screen_utils.dart';
import '../utils/screen_utils.dart';
import '../widgets/payment_type.dart';
import './bill_type_screen.dart';
import './mobile_recharge_screen.dart';

class PaymentScreen extends StatelessWidget {
  const PaymentScreen({super.key});

  @override
  Widget build(BuildContext context) {
    double height = ScreenUtils.height(context);
    double width = ScreenUtils.width(context);

    return Container(
      color: primaryColor,
      width: double.infinity,
      child: Column(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: <Widget>[
          // Text("Image"),

          //  Container(
          //     child: Image.asset('assets/icons/logo.png'),
          //   ),

          //bill payment mobile recharge
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: <Widget>[
              PaymentType(
                  imgSrc:
                      'assets/icons/bill.png',
                  imgText: "Bill \nPayment",
                  func: () {
                    Navigator.of(context)
                        .push(MaterialPageRoute(builder: (context) {
                      return BillTypeScreen();
                    }));
                  }),
              PaymentType(
                imgSrc:
                    'assets/icons/smartphone.png',
                imgText: "Mobile \nRecharge",
                func: () {
                  Navigator.of(context)
                      .push(MaterialPageRoute(builder: (context) {
                    return MobileRechargeScreen();
                  }));
                },
              ),
            ],
          ),

          //CreditCard Loan Repayment
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: <Widget>[
              PaymentType(
                  imgSrc:
                      'assets/icons/credit-card.png',
                  imgText: "Credit \nCard"),
              PaymentType(
                  imgSrc:
                      'assets/icons/smartphone.png',
                  imgText: "Loan \nRepayment"),
            ],
          ),
        ],
      ),
      //   ),
      // ),
    );
  }
}
