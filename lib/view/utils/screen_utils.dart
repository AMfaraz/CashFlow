import 'package:flutter/material.dart';

class ScreenUtils{
  static double height(BuildContext context){
    return MediaQuery.of(context).size.height;
  }
   static double width(BuildContext context){
    return MediaQuery.of(context).size.width;
  }
}