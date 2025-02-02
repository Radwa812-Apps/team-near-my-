import 'package:flutter/material.dart';

import '../../../../core/constants.dart';


class ButtonWidget extends StatelessWidget {
  final String name;
  final Function()? onTap;
  final Size? size;
  final double? fontSize;
  final bool? isEnabled;

  const ButtonWidget({
    super.key,
    required this.name,
    required this.onTap,
    required this.size,
    required this.fontSize,
    this.isEnabled = true,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onTap,
      style: ElevatedButton.styleFrom(
        backgroundColor: kSpecialColor, // Set button background color
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(40), // Rounded corners
        ),
        padding: EdgeInsets.symmetric(vertical: 15), // Adjust padding
        minimumSize: size, // Set button size
      ),
      child: Text(
        name,
        style: TextStyle(
          color: Colors.white,
          fontFamily: kFontSemiBold,
          fontSize: fontSize,
        ),
      ),
    );
  }
}
