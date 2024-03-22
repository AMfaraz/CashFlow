import 'package:flutter/material.dart';

import '../utils/colors.dart';
import '../utils/text_theme.dart' as th;
import '../widgets/signin_widget/custom_text_field.dart';
import '../utils/screen_utils.dart';

class SigninScreen extends StatefulWidget {
  const SigninScreen({super.key});

  @override
  State<SigninScreen> createState() => _SigninScreenState();
}

class _SigninScreenState extends State<SigninScreen> {
  final TextEditingController _fNameController = TextEditingController();
  final TextEditingController _lNameController = TextEditingController();
  final TextEditingController _addressController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _phoneNumberController = TextEditingController();
  final TextEditingController _cnicController= TextEditingController();
  final TextEditingController _passwordController = TextEditingController();




  @override
  Widget build(BuildContext context) {

    double width=ScreenUtils.width(context);

    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
            width: double.infinity,
            color: primaryColor,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                
          
                //first name
                CustomTextField(label: "Enter your First Name", textEditingController: _fNameController),
          
                 //last name
                CustomTextField(label: "Enter your last Name", textEditingController: _lNameController),
          
                //address name
                CustomTextField(label: "Enter your Address", textEditingController: _addressController),
          
                //email 
                CustomTextField(label: "Enter your email", textEditingController: _emailController),
          
                //phone number
                CustomTextField(label: "Enter your phone Number", textEditingController: _phoneNumberController),
          
                //cnic
                CustomTextField(label: "Enter your cnic", textEditingController: _cnicController),
          
                //password
                CustomTextField(label: "Enter your cnic", textEditingController: _passwordController),

                 //Login Button
                  Container(
                    alignment: Alignment.center,
                    margin: const EdgeInsets.only(top: 20, bottom: 10),
                    child: ElevatedButton(
                      onPressed: () {},
                      style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.blueGrey,
                          minimumSize: Size(width*0.4, 40),
                          maximumSize: Size(800, 40)),
                      child: const Text(
                        "Sign in",
                        style: th.TextTheme.heading,
                      ),
                    ),
                  ),
          
                
          
              ],
            ),
          ),
        ),
      ),
    );
  }
}
