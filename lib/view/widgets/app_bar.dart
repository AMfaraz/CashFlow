import 'package:flutter/material.dart';

import '../utils/colors.dart';

class CustomAppBar extends StatelessWidget {
  const CustomAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
            margin: const EdgeInsets.only(top: 10,left: 10,right: 10),
          color: secondaryColor,
            child: const Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                  Text(" "),
                  Icon(Icons.abc),
              ],
            ),
        );
  }
}