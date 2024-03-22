import 'package:flutter/material.dart';

import '../utils/colors.dart';
import '../widgets/NavDrawer.dart';
import '../screens/home_screen.dart';
import '../screens/payment_screen.dart';
import '../screens/sending_money_screen.dart';
import '../../control/db_handler.dart';
import '../../model/customer_model.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  //string to refer to _screenDetails
  final List<String> _pages = [
    "HomeScreen",
    "PaymentScreen",
    "SendingMoneyScreen"
  ];

  //every data of screen
  final Map<String, List<dynamic>> _screenDetails = {
    "HomeScreen": [HomeScreen(), "Home", const Icon(Icons.mobile_friendly)],
    "PaymentScreen": [
      PaymentScreen(),
      "Payment",
      const Icon(Icons.payment_outlined)
    ],
    "SendingMoneyScreen": [SendingMoneyScreen(), "Send", const Icon(Icons.send)]
  };

  int _selectedIndex = 0;

  // void gettingData() async {
  //   List<Map<String, dynamic>> data = await DbHandler().readData("Customers");
  //   CustomerModel.convert(data);
  // }

  // @override
  // void initState() {
  //   gettingData();
  //   // TODO: implement initState
  //   super.initState();
  // }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: primaryColor,
        appBar: AppBar(
          title: Text(_screenDetails[_pages[_selectedIndex]]![1]),
          actions: [
            Container(
                margin: const EdgeInsets.only(top: 10, right: 10),
                child: _screenDetails[_pages[_selectedIndex]]![2])
          ],
          backgroundColor: secondaryColor,
        ),
        drawer: NavDrawer(),

        //bottomnavigation to change pages
        bottomNavigationBar: BottomNavigationBar(
          iconSize: 25,
          selectedFontSize: 15,
          unselectedFontSize: 10,
          // type: BottomNavigationBarType.fixed,
          selectedItemColor: Colors.amber[800],
          backgroundColor: secondaryColor,
          currentIndex: _selectedIndex,
          onTap: (int index) {
            setState(() {
              _selectedIndex = index;
            });
          },
          items: const <BottomNavigationBarItem>[
            BottomNavigationBarItem(icon: Icon(Icons.home), label: "Home"),
            BottomNavigationBarItem(
                icon: Icon(Icons.payment), label: "Payment"),
            BottomNavigationBarItem(
                icon: Icon(Icons.send_outlined), label: "Send Money"),
          ],
        ),

        body: _screenDetails[_pages[_selectedIndex]]![0],
      ),
    );
  }
}
