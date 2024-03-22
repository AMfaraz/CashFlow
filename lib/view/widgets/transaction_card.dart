import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

import '../utils/colors.dart';
import '../utils/text_theme.dart' as th;

class TransactionCard extends StatelessWidget {
  final String bank;
  final String name;
  final int amount;

  const TransactionCard({super.key,required this.amount,required this.bank,required this.name});

  @override
  Widget build(BuildContext context) {
    return Container(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
            margin: const EdgeInsets.symmetric(horizontal: 5, vertical: 10),

            decoration: BoxDecoration(
              color: secondaryColor,
              borderRadius: BorderRadius.circular(30),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text(
                  bank,
                  style: th.TextTheme.subHeading.copyWith(color: Colors.black,fontSize: 20),
                ),
                Text(
                  name,
                  style: th.TextTheme.subHeading.copyWith(color: Colors.black,fontSize: 20),
                ),
                Container(
                  child: Text(
                    "Rs $amount /",
                    style: TextStyle(color: primaryColor,fontSize: 20),
                  ),
                  alignment: Alignment.bottomRight,
                ),
              ],
            ),
          );
  }
}