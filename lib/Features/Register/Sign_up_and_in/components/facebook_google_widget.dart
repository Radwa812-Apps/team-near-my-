import 'package:flutter/material.dart';

class FacebookGoogleWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        SizedBox(
          width: 55, // Set desired width
          height: 55, // Set desired height
          child: Image(
            image: AssetImage('assets/images/google.png'),
            fit: BoxFit.contain, // Adjust the image fit
          ),
        ),
        SizedBox(width: 40),
        SizedBox(
          width: 55, // Set desired width
          height: 55, // Set desired height
          child: Image(
            image: AssetImage('assets/images/facebook.png'),
            fit: BoxFit.contain, // Adjust the image fit
          ),
        ),
      ],
    );
  }
}
