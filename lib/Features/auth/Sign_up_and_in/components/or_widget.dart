import 'package:flutter/material.dart';

import '../../../../core/constants.dart';

class ORWediget extends StatelessWidget {
  final double? oRsize;
  final double? lineWidth;

  const ORWediget({super.key, this.oRsize, this.lineWidth});
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          height: 1.0, // Height of the line
          color: Colors.white,
          width: lineWidth, // Color of the line
        ),
        SizedBox(
          width: 10,
        ),
        Text(
          'OR',
          style: TextStyle(
            color: Colors.white,
            fontSize: oRsize,
            fontFamily: kFontRegular,
          ),
        ),
        SizedBox(
          width: 10,
        ),
        Container(
          height: 1.0, // Height of the line
          color: Colors.white,
          width: lineWidth, // Color of the line
        ),
      ],
    );
  }
}
