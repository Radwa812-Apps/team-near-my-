import 'package:flutter/material.dart';
import 'package:nearme_app/Features/Register/Forgot_password/components/password_line_under.dart';
import 'package:nearme_app/core/Icons/confirm.dart';

import 'package:nearme_app/core/Icons/lock.dart';
import 'package:nearme_app/core/Icons/password_visibility_toggle.dart';
import 'package:nearme_app/core/font_style.dart';

import 'package:nearme_app/core/Icons/arrow_back.dart';

class ChangePassword extends StatelessWidget {
  const ChangePassword({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromRGBO(255, 255, 255, 1),
      body: Center(
        child: Container(
          width: 393,
          height: 852,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(40),
            color: const Color.fromRGBO(255, 255, 255, 1),
          ),
          child: Stack(
            children: <Widget>[
              const ArrowBack(),

              const Positioned(
                top: 297,
                left: 91,
                child: SizedBox(
                  width: 200,
                  child: TextField(
                    decoration: InputDecoration(
                      hintText: 'New Password',
                      hintStyle: TextStyles.forgotPasswordText,
                      border: InputBorder.none,
                      isDense: true,
                    ),
                    style: TextStyles.forgotPasswordText,
                    textAlign: TextAlign.left,
                  ),
                ),
              ),

              const PasswordLineUnder(top: 336, left: 40),
              // Confirm Password Text
              const Positioned(
                top: 389,
                left: 90,
                child: SizedBox(
                  width: 200,
                  child: TextField(
                    decoration: InputDecoration(
                      hintText: 'Confirm Password',
                      hintStyle: TextStyles.forgotPasswordText,
                      border: InputBorder.none,
                      isDense: true,
                    ),
                    style: TextStyles.forgotPasswordText,
                    textAlign: TextAlign.left,
                  ),
                ),
              ),
              const PasswordLineUnder(top: 434, left: 40),
              // Save Button
              Positioned(
                top: 467,
                left: 44,
                child: GestureDetector(
                  onTap: () {
                    print('Save Button Pressed');
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
                        'Save',
                        textAlign: TextAlign.center,
                        style: TextStyles.forgotPasswordButtonText,
                      ),
                    ),
                  ),
                ),
              ),
              const PasswordVisibilityToggle(
                top: 305,
                left: 320,
              ),
              const PasswordVisibilityToggle(top: 397, left: 320),
              const Lock(top: 305, left: 40),
              const Confirm(top: 397, left: 40)
            ],
          ),
        ),
      ),
    );
  }
}
