import 'package:cash_flow/view/screens/bill_type_screen.dart';
import 'package:cash_flow/view/screens/company_electricity_screen.dart';
import 'package:cash_flow/view/screens/setting_screen.dart';
import 'package:cash_flow/view/screens/transaction_history_screen.dart';
import 'package:flutter/material.dart';

import './view/screens/home_screen.dart';
import 'package:cash_flow/view/screens/payment_screen.dart';
import './view/screens/main_screen.dart';
import './model/customer_model.dart';
import './control/db_handler.dart';
import './view/screens/login_screen.dart';
import 'view/screens/sign_screen.dart';
import './view/screens/my_account_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    // MySqlCon mysql=MySqlCon();

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Cashflow',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // TRY THIS: Try running your application with "flutter run". You'll see
        // the application has a purple toolbar. Then, without quitting the app,
        // try changing the seedColor in the colorScheme below to Colors.green
        // and then invoke "hot reload" (save your changes or press the "hot
        // reload" button in a Flutter-supported IDE, or press "r" if you used
        // the command line to start the app).
        //
        // Notice that the counter didn't reset back to zero; the application
        // state is not lost during the reload. To reset the state, use hot
        // restart instead.
        //
        // This works for code too, not just values: Most code changes can be
        // tested with just a hot reload.
        // colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: LoginScreen(),
      // home: CompanyScreen(),


      //running this after succesfull login signup
      // home: FutureBuilder(
      //     //future to read data
      //     future: DbHandler().readData("Customers"),
      //     builder: (context, snapshot) {

      //       //loading
      //       if (snapshot.connectionState == ConnectionState.waiting) {
      //         return const CircularProgressIndicator();
      //       }

      //       //not found
      //       if (snapshot.hasError) {
      //         return const Scaffold(
      //           body: Center(
      //             child: Text(
      //               "Error",
      //               style: TextStyle(fontSize: 100),
      //             ),
      //           ),
      //         );
      //       }

      //       //after successful login
      //       else{
      //         CustomerModel.setCurrentCustomer(snapshot.data!);
      //         return MainScreen();
      //       }
      //     }),
    );
  }
}
