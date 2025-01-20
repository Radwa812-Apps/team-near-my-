import 'package:flutter/material.dart';
import 'package:nearme_app/Features/Register/Forgot_password/Screens/confirm_password.dart';
import 'package:nearme_app/core/Icons/arrow_back.dart'; // Ensure this import is correct
import 'package:nearme_app/core/font_style.dart'; // Ensure this import is correct

class ForgotPassword extends StatelessWidget {
  const ForgotPassword({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromRGBO(253, 253, 253, 1),
      body: Center(
        child: Container(
          width: 393,
          height: 852,
          child: Stack(
            children: <Widget>[
              // Back Button
              const ArrowBack(),

              const Positioned(
                top: 349,
                left: 72,
                child: SizedBox(
                  width: 250,
                  child: TextField(
                    decoration: InputDecoration(
                      hintText: 'Email / Phone',
                      hintStyle: TextStyles.forgotPasswordText,
                      border: InputBorder.none,
                    ),
                    style: TextStyles.forgotPasswordText,
                  ),
                ),
              ),

              Positioned(
                top: 390,
                left: 63,
                child: Container(
                  width: 269,
                  height: 0.25,
                  color: const Color.fromRGBO(61, 83, 0, 1),
                ),
              ),

              // Send Code Button
              Positioned(
                top: 454,
                left: 44,
                child: GestureDetector(
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => ConfirmPassword(),
                        ));
                  },
                  child: Container(
                    width: 304,
                    height: 64,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(1000),
                      color: const Color.fromRGBO(255, 212, 73, 1),
                    ),
                    child: const Center(
                      child: Text(
                        'Send Code',
                        style: TextStyles.forgotPasswordButtonText,
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
