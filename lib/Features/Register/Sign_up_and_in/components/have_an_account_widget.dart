import 'package:flutter/material.dart';

import '../../../../core/constants.dart';

class HaveAnAccountWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          "Already have an account?",
          style: TextStyle(
            color: Colors.white,
            fontSize: 18,
            fontFamily: 'OpenSans-Bold',
            fontWeight: FontWeight.bold,
          ),
        ),
        TextButton(
          onPressed: () {
            Navigator.pushNamed(context, 'SignInScreen');
          },
          child: Text(
            "Sign In",
            style: TextStyle(
              color: kSpecialColor, // You can change the color
              fontSize: 18,
              fontFamily: 'OpenSans-Bold',
            ),
          ),
        ),
      ],
    );
  }
}
