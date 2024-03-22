import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

import 'package:cash_flow/view/utils/colors.dart';
import '../utils/screen_utils.dart';
import '../utils/text_theme.dart' as th;

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {

  TextEditingController emailController=TextEditingController();
  TextEditingController passwordController=TextEditingController();


  @override
  Widget build(BuildContext context) {
    double height = ScreenUtils.height(context);
    double width = ScreenUtils.width(context);

    return Scaffold(
      body: Container(
        width: double.infinity,
        color: primaryColor,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Container(
              child: const Text("hello"),
            ),
            Container(
              padding: const EdgeInsets.all(15),
              height: height * 0.5,
              width: double.infinity,
              color: secondaryColor,

              //login fields
              child: Column(
                children: <Widget>[

                  //email
                  Container(
                    margin: const EdgeInsets.all(10),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(50),
                      border: Border.all(color: Colors.grey),
                    ),
                    child: ListTile(
                      leading: const Icon(Icons.person),
                      title: TextField(
                        controller: emailController,
                        decoration: const InputDecoration(
                            // hintText: "Login Id",
                            border: InputBorder.none,
                            labelText: "Login Id"),
                      ),
                      trailing: const Text(
                        "Forgot Id",
                        style: th.TextTheme.subHeading,
                      ),
                    ),
                  ),

                  //password
                  Container(
                    margin: const EdgeInsets.all(10),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(50),
                      border: Border.all(color: Colors.grey),
                    ),
                    child: ListTile(
                      leading: const Icon(Icons.lock),
                      title: TextField(
                        controller: passwordController,
                        obscureText: true,
                        decoration: const InputDecoration(
                            // hintText: "Login Id",
                            border: InputBorder.none,
                            labelText: "Password"),
                      ),
                      trailing: const Text(
                        "Password ID?",
                        style: th.TextTheme.subHeading,
                      ),
                    ),
                  ),

                  //Login Button
                  Container(
                    margin: const EdgeInsets.only(top: 20, bottom: 10),
                    child: ElevatedButton(
                      onPressed: () {},
                      style: ElevatedButton.styleFrom(
                          backgroundColor: primaryColor,
                          minimumSize: Size(width*0.4, 40),
                          maximumSize: Size(800, 40)),
                      child: const Text(
                        "Login",
                        style: th.TextTheme.heading,
                      ),
                    ),
                  ),

                  //dont have an account signin
                  Padding(
                    padding: const EdgeInsets.all(18),
                    child: RichText(
                      text: TextSpan(
                        text: 'Don\'t have an account?',
                        style: const TextStyle(color: Colors.black, fontSize: 18),
                        children: <TextSpan>[
                          TextSpan(
                              text: ' Sign up',
                              style: const TextStyle(
                                  color: Colors.blueAccent, fontSize: 18),
                              recognizer: TapGestureRecognizer()
                                ..onTap = () {
                                  // navigate to desired screen
                                })
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
