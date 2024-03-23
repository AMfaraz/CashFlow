import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

import '../utils/colors.dart';
import '../widgets/payment_type.dart';
import './company_electricity_screen.dart';
import './company_gas_services.dart';
import './company_water_screen.dart';


class BillTypeScreen extends StatelessWidget {
  const BillTypeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      appBar: AppBar(
          title: const Text("Transaction History"),
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
      child: Column(
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
                  imgText: "Electricity \n Bill",
                  func: () {
                    Navigator.of(context)
                        .push(MaterialPageRoute(builder: (context){
                          return CompanyElectricityScreen();
                        }));
                  },),
              PaymentType(
                  imgSrc:
                      'https://www.shutterstock.com/shutterstock/photos/741444880/display_1500/stock-vector-invoice-line-icon-payment-and-bill-invoice-order-symbol-concept-tax-sign-design-paper-bank-741444880.jpg',
                  imgText: "Gas \nBill",
                  func:  () {
                    Navigator.of(context)
                        .push(MaterialPageRoute(builder: (context){
                          return CompanyGasScreen();
                        }));
                  },),
            ],
          ),

          //CreditCard Loan Repayment
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: <Widget>[
              PaymentType(
                  imgSrc:
                      'https://www.shutterstock.com/shutterstock/photos/741444880/display_1500/stock-vector-invoice-line-icon-payment-and-bill-invoice-order-symbol-concept-tax-sign-design-paper-bank-741444880.jpg',
                  imgText: "Water \nBill",func: () {
                    Navigator.of(context)
                        .push(MaterialPageRoute(builder: (context){
                          return CompanyWaterScreen();
                        }));
                  },),
              PaymentType(
                  imgSrc:
                      'https://www.shutterstock.com/shutterstock/photos/741444880/display_1500/stock-vector-invoice-line-icon-payment-and-bill-invoice-order-symbol-concept-tax-sign-design-paper-bank-741444880.jpg',
                  imgText: "Internet \Bill"),
            ],
          ),
        ],
      ),
      //   ),
      // ),
    ),
    ),
    );
  }
}
