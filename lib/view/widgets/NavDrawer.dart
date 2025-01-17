import 'package:flutter/material.dart';

import '../screens/transaction_history_screen.dart';
import '../screens/my_account_screen.dart';
import '../screens/setting_screen.dart';

class NavDrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: <Widget>[
          DrawerHeader(
            // child: Text("Hello"),
            // child: Image.asset('assets/icons/logo.png'),
            child: ImageIcon(AssetImage('assets/icons/logo.png')),
            // child:Container(
            //     child: Image.asset('assets/icons/logo.png'),
            //   ),
            // decoration: BoxDecoration(
            //     color: Colors.green,
            //     image: DecorationImage(
            //         fit: BoxFit.fill,
            //         image: AssetImage('assets/images/cover.jpg'))),
            // child: Text(
            //   'Side menu',
            //   style: TextStyle(color: Colors.white, fontSize: 25),
            // ),
          ),
          ListTile(
            leading: Icon(Icons.input),
            title: Text('My Account'),
            onTap: () => Navigator.of(context).push(MaterialPageRoute(builder: (context) {
                return MyAccountScreen();
              }))
          ),
          ListTile(
            leading: Icon(Icons.verified_user),
            title: Text('Transaction History'),
            onTap: () => {
              Navigator.of(context).push(MaterialPageRoute(builder: (context) {
                return TransactionHistoryScreen();
              }))
            },
          ),
          ListTile(
            leading: Icon(Icons.settings),
            title: Text('Settings'),
            onTap: () => {Navigator.of(context).push(MaterialPageRoute(builder: (context) {
                return SettingScreen();
              }))},
          ),

          ListTile(
            leading: Icon(Icons.exit_to_app),
            title: Text('Logout'),
            onTap: () => {Navigator.of(context).pop()},
          ),
        ],
      ),
    );
  }
}
