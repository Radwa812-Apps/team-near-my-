import 'package:flutter/material.dart';
import 'package:nearme_app/Features/auth/Forgot_password/Screens/change_password.dart';
import 'package:nearme_app/core/Icons/arrow_back.dart';
import 'package:nearme_app/core/constants.dart';
import 'package:nearme_app/core/font_style.dart';

import '../components/circle_indicator.dart';
import '../components/custom_text_field.dart';
import '../components/forgot_password_button.dart';

class ConfirmPassword extends StatelessWidget {
  ConfirmPassword({super.key});
  static const confirmPasswordKey = 'ConfirmPassword';
  final _controllers = List.generate(4, (_) => TextEditingController());
  final _focusNodes = List.generate(4, (_) => FocusNode());

  bool _validateCode(BuildContext context) {
    for (var controller in _controllers) {
      if (controller.text.isEmpty) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text('You should enter the code'),
            duration: Duration(seconds: 2),
            backgroundColor: Colors.red,
          ),
        );
        return false;
      }
    }
    return true;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: background,
      body: SingleChildScrollView(
        child: Center(
          child: SizedBox(
            width: 393,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const SizedBox(
                  height: 20,
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Align(
                    alignment: Alignment.topLeft,
                    child: Container(
                      padding: const EdgeInsets.all(10),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(30),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey.withOpacity(0.5),
                            spreadRadius: 2,
                            blurRadius: 5,
                            offset: const Offset(0, 3),
                          ),
                        ],
                      ),
                      child: const Icon(
                        Icons.arrow_back_ios_outlined,
                        color: Colors.black,
                      ),
                    ),
                  ),
                ),

                const SizedBox(height: 200),
                // Circle Indicators Row
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    CircleIndicator(
                      child: CustomTextField(
                        controller: _controllers[0],
                        currentFocus: _focusNodes[0],
                        nextFocus: _focusNodes[1],
                      ),
                    ),
                    CircleIndicator(
                      child: CustomTextField(
                        controller: _controllers[1],
                        currentFocus: _focusNodes[1],
                        nextFocus: _focusNodes[2],
                      ),
                    ),
                    CircleIndicator(
                      child: CustomTextField(
                        controller: _controllers[2],
                        currentFocus: _focusNodes[2],
                        nextFocus: _focusNodes[3],
                      ),
                    ),
                    CircleIndicator(
                      child: CustomTextField(
                        controller: _controllers[3],
                        currentFocus: _focusNodes[3],
                        nextFocus: null,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 50),
                // Confirm Button
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: kSpecialColor,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30),
                      ),
                      minimumSize: const Size(double.infinity, 50),
                    ),
                    onPressed: () {
                      Navigator.pushNamed(
                          context, ChangePassword.changePasswordKey);
                    },
                    child: const Text(
                      'Confirm',
                      style:
                          TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                    ),
                  ),
                ),

                // ForgotPasswordButton(
                //     buttonText: 'Confirm',
                //     onTap: () {
                //       Navigator.pushNamed(context, 'ChangePassword');
                //     })
              ],
            ),
          ),
        ),
      ),
    );
  }
}
