import 'package:flutter/material.dart';

import '../../utils/colors.dart';
import '../../utils/text_theme.dart' as th;

class CustomTextField extends StatelessWidget {

  final String label;
  final TextEditingController textEditingController;

  const CustomTextField({super.key,required this.label,required this.textEditingController});

  @override
  Widget build(BuildContext context) {
    return  Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                   Text(
                    label,
                    style: th.TextTheme.subHeading,
                  ),
                  Container(
                    color: secondaryColor,
                    margin:
                        const EdgeInsets.symmetric(horizontal: 5, vertical: 15),
                    padding:
                        const EdgeInsets.symmetric(horizontal: 15, vertical: 5),
                    child: TextField(
                      controller: textEditingController,
                      decoration: const InputDecoration(border: InputBorder.none),
                    ),
                  ),
                ],
              );
  }
}