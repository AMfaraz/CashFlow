import 'package:flutter/material.dart';

import '../utils/colors.dart';
// import '../widgets/custom_texfield.dart' as th;
// import 'package:cash_flow/view/widgets/signin_widget/custom_text_field.dart';
import '../utils/text_theme.dart' as th;
import '../../control/customer_handler.dart';

class LoginIdChangeScreen extends StatefulWidget {
  const LoginIdChangeScreen({super.key});

  @override
  State<LoginIdChangeScreen> createState() => _LoginIdChangeScreenState();
}

class _LoginIdChangeScreenState extends State<LoginIdChangeScreen> {
  final TextEditingController _oldEmailController = TextEditingController();
  final TextEditingController _newEmailController = TextEditingController();
  final TextEditingController _confirmEmailController =
      TextEditingController();

  final CustomerHandler _customerHandler = CustomerHandler();

  @override
  void dispose() {
    _oldEmailController.dispose();
    _newEmailController.dispose();
    _confirmEmailController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: primaryColor,
        appBar: AppBar(
          title: const Text("ID"),
          actions: [
            Container(
                margin: const EdgeInsets.only(top: 10, right: 10),
                child: const Icon(Icons.email))
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
                  "Old Email",
                  style: th.TextTheme.subHeading,
                ),
                TextField(
                  decoration: InputDecoration(
                      hintText: "Enter Old Email",
                      hintStyle: th.TextTheme.subHeading),
                  controller: _oldEmailController,
                  style: th.TextTheme.subHeading,
                  obscureText: true,
                ),
          
                const SizedBox(
                  height: 50,
                ), //new password
                const Text(
                  "New Email",
                  style: th.TextTheme.subHeading,
                ),
                TextField(
                  decoration: InputDecoration(
                      hintText: "Enter New Email",
                      hintStyle: th.TextTheme.subHeading),
                  controller: _newEmailController,
                  style: th.TextTheme.subHeading,
                  obscureText: true,
                ),
          
                const SizedBox(
                  height: 50,
                ), //new password
          
                //confirm password
                const Text(
                  "confrim Email",
                  style: th.TextTheme.subHeading,
                ),
                TextField(
                  decoration: InputDecoration(
                      hintText: "Confrim Email",
                      hintStyle: th.TextTheme.subHeading),
                  controller: _confirmEmailController,
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
                      if (_newEmailController.text !=
                          _confirmEmailController.text) {
                        ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(content: Text('Reconfirm the email')));
                        return;
                      }
                      bool result =
                          await _customerHandler.changeCurrentCustomerPassword(
                              _oldEmailController.text,
                              _newEmailController.text);
                      
          
                      //checking if successful
                      if(result){
                         ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(content: Text('Successfully changed the email')));
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
