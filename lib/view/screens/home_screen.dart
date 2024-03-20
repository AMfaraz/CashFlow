import 'package:flutter/material.dart';

import 'package:cash_flow/view/utils/colors.dart';
import '../utils/screen_utils.dart';
import '../utils/text_theme.dart' as th;
import '../../control/db_handler.dart';
import '../widgets/NavDrawer.dart';
import '../widgets/app_bar.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // _check();
    // print(ans);

    final double height = ScreenUtils.height(context);
    final double width = ScreenUtils.width(context);

    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text("Home"),
          actions: [
            Container(
                margin: const EdgeInsets.only(top: 10, right: 10),
                child: const Icon(Icons.mobile_friendly))
          ],
          backgroundColor: secondaryColor,
        ),
        drawer: NavDrawer(),
        body:
            //outer container
            Container(
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
                  "Welcome, hello",
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
                  "Balance 1000/ Rs",
                  style:
                      th.TextTheme.subHeading.copyWith(color: secondaryColor),
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
        ),

        //changing pages
        bottomNavigationBar: BottomNavigationBar(
          iconSize: 30,
          selectedFontSize: 20,
          unselectedFontSize: 15,
          // showUnselectedLabels: false,
          // type: BottomNavigationBarType.shifting,
          backgroundColor: secondaryColor,
          onTap: (int index) {},
          items: const <BottomNavigationBarItem>[
            BottomNavigationBarItem(icon: Icon(Icons.home), label: "Home"),
            BottomNavigationBarItem(
                icon: Icon(Icons.payment), label: "Payment"),
            BottomNavigationBarItem(
                icon: Icon(Icons.send_outlined), label: "Send Money"),
          ],
        ),
      ),
    );
  }
}
