import 'package:flutter/material.dart';

import 'package:cash_flow/view/utils/colors.dart';
import '../utils/screen_utils.dart';
import '../utils/text_theme.dart' as th;
import '../../control/db_handler.dart';
import '../../model/customer_model.dart';
import '../../model/account_model.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {

    final double height = ScreenUtils.height(context);
    final double width = ScreenUtils.width(context);

    return Container(
      width: double.infinity,
      decoration: BoxDecoration(color: primaryColor),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          const SizedBox(
            height: 40,
          ),

          //Welcomeuser
          Container(
            decoration: const BoxDecoration(color: secondaryColor),
            padding: const EdgeInsets.symmetric(vertical: 20),
            alignment: Alignment.center,
            child: Text(
              "Welcome, ${CustomerModel.logedInCustomer.firstName}",
              style: th.TextTheme.subHeading.copyWith(color: primaryColor),
            ),
          ),

          //balance
          const SizedBox(
            height: 10,
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              "Balance ${AccountModel.currentAccount.balance} /RS",
              style: th.TextTheme.subHeading.copyWith(color: secondaryColor),
            ),
          ),

          Divider(
            color: Colors.white,
            height: 8,
            endIndent: width * 0.25,
          )

          // TextButton(
          //     onPressed: () async {
          //       await DbHandler().insertData(
          //         "Customers",
          //         "Abdul Majeed",
          //         "Faraz",
          //         "House no B56",
          //         "faraz@gmail.com",
          //         "03563015852",
          //         "3120698752433",
          //         "faraz123"
          //       );
          //       final data=await DbHandler().readData("Customers");
          //       print(data);
          //     },
          //     child: Text("change"))
        ],
      ),
    );

  }
}
