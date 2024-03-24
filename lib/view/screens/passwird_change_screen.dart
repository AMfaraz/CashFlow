import 'package:flutter/material.dart';

import '../utils/colors.dart';
// import '../widgets/custom_texfield.dart' as th;
// import 'package:cash_flow/view/widgets/signin_widget/custom_text_field.dart';
import '../utils/text_theme.dart' as th;
import '../../control/customer_handler.dart';

class PasswordChangeScreen extends StatefulWidget {
  const PasswordChangeScreen({super.key});

  @override
  State<PasswordChangeScreen> createState() => _PasswordChangeScreenState();
}

class _PasswordChangeScreenState extends State<PasswordChangeScreen> {
  final TextEditingController _oldPasswordController = TextEditingController();
  final TextEditingController _newPasswordController = TextEditingController();
  final TextEditingController _confirmPasswordController =
      TextEditingController();

  final CustomerHandler _customerHandler = CustomerHandler();

  @override
  void dispose() {
    _oldPasswordController.dispose();
    _newPasswordController.dispose();
    _confirmPasswordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: primaryColor,
        appBar: AppBar(
          title: const Text("Password"),
          actions: [
            Container(
                margin: const EdgeInsets.only(top: 10, right: 10),
                child: const Icon(Icons.password))
          ],
          backgroundColor: secondaryColor,
        ),
        body: SingleChildScrollView(
          child: Container(
            margin: const EdgeInsets.all(15),
            padding: const EdgeInsets.all(15),
            width: double.infinity,
            color: primaryColor,
            child: (Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                //old password
                const Text(
                  "Old Password",
                  style: th.TextTheme.subHeading,
                ),
                TextField(
                  decoration: InputDecoration(
                      hintText: "Enter Old Password",
                      hintStyle: th.TextTheme.subHeading),
                  controller: _oldPasswordController,
                  style: th.TextTheme.subHeading,
                  obscureText: true,
                ),
          
                const SizedBox(
                  height: 50,
                ), //new password
                const Text(
                  "New Password",
                  style: th.TextTheme.subHeading,
                ),
                TextField(
                  decoration: InputDecoration(
                      hintText: "Enter New Password",
                      hintStyle: th.TextTheme.subHeading),
                  controller: _newPasswordController,
                  style: th.TextTheme.subHeading,
                  obscureText: true,
                ),
          
                const SizedBox(
                  height: 50,
                ), //new password
          
                //confirm password
                const Text(
                  "confrim Password",
                  style: th.TextTheme.subHeading,
                ),
                TextField(
                  decoration: InputDecoration(
                      hintText: "Confrim Password",
                      hintStyle: th.TextTheme.subHeading),
                  controller: _confirmPasswordController,
                  style: th.TextTheme.subHeading,
                  obscureText: true,
                ),
          
                const SizedBox(
                  height: 50,
                ), //new password
          
                //change
                Container(
                  alignment: Alignment.bottomCenter,
                  margin: const EdgeInsets.only(top: 15),
                  child: ElevatedButton(
                    onPressed: () async {
                      //confirming the password
                      if (_newPasswordController.text !=
                          _confirmPasswordController.text) {
                        ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(content: Text('Reconfirm the password')));
                        return;
                      }
                      bool result =
                          await _customerHandler.changeCurrentCustomerPassword(
                              _oldPasswordController.text,
                              _newPasswordController.text);
                      
          
                      //checking if successful
                      if(result){
                         ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(content: Text('Successfully changed the password')));
                      }
                      else{
                         ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(content: Text('Something wrong')));
                      }
                    },
                    child: const Text("Change"),
                  ),
                ),
              ],
            )),
          ),
        ),
      ),
    );
  }
}
