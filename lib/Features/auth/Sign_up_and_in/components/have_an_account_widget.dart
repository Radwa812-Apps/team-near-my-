import 'package:flutter/material.dart';

import '../../../../core/constants.dart';

class HaveAnAccountWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const Text(
          "Already have an account?",
          style: TextStyle(
            color: Colors.white,
            fontSize: 18,
            fontFamily: kFontBold,
            fontWeight: FontWeight.bold,
          ),
        ),
        TextButton(
          onPressed: () {
            Navigator.pushNamed(context, 'SignInScreen');
          },
          child: const Text(
            "Sign In",
            style: TextStyle(
              color: kSpecialColor, 
              fontSize: 18,
              fontFamily: kFontBold,
            ),
          ),
        ),
      ],
    );
  }
}
