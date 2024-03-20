import 'package:flutter/material.dart';

import '../utils/screen_utils.dart';
import '../utils/colors.dart';

class PaymentType extends StatelessWidget {

  final String imgSrc;
  final String imgText;

  const PaymentType({super.key,required this.imgSrc,required this.imgText});

  @override
  Widget build(BuildContext context) {
    // final double height = ScreenUtils.height(context);
    final double width = ScreenUtils.width(context);

    return GestureDetector(
      onTap: (){},
      child: Container(
        padding: const EdgeInsets.all(12),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12),
          color: secondaryColor
        ),
        // width: width * 0.33,
        width: (width*0.33>200)?200:width *0.33,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          mainAxisSize: MainAxisSize.max,
          children: <Widget>[
            Image.network(
              fit: BoxFit.scaleDown,
              imgSrc,
            ),
            Text(imgText,textAlign: TextAlign.center,)
          ],
        ),
      ),
    );
  }
}
