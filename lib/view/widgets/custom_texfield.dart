import 'package:flutter/material.dart';

Widget buildTextField(
  TextEditingController controller,
) {
  return Padding(
    padding: EdgeInsets.symmetric(horizontal: 20.0),
    child: TextField(
      controller: controller,
      style: TextStyle(color: Color(0XFF39a8ed)),
      decoration: InputDecoration(),
    ),
  );
}
