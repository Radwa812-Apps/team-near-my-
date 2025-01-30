import 'package:flutter/material.dart';
import 'package:nearme_app/core/constants.dart';

class Button extends StatelessWidget {
  const Button({
    super.key,
    required this.onTap,
    required this.nameOfButton,
    required this.backgroundColor,
  });

  final VoidCallback onTap;
  final String? nameOfButton;
  final Color? backgroundColor;
  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onTap,
      style: ElevatedButton.styleFrom(
        backgroundColor: backgroundColor, // Background color of the button
        foregroundColor: Colors.white, // Text color
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(40.0),
          // Rounded corners
        ),
        minimumSize: Size(70, 10),
        padding:
            EdgeInsets.symmetric(horizontal: 16.0, vertical: 12.0), // Padding
      ),
      child: Text(
        nameOfButton!,
        style: TextStyle(
          fontFamily: kFontRegular,
          fontStyle: FontStyle.normal,
        ),
      ),
    );
  }
}
