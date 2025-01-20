/*import 'package:flutter/material.dart';
import 'package:nearme_app/Features/Register/Forgot_password/components/password_line_under.dart';
import 'package:nearme_app/core/Icons/confirm.dart';

import 'package:nearme_app/core/Icons/lock.dart';
import 'package:nearme_app/core/Icons/password_visibility_toggle.dart';
import 'package:nearme_app/core/font_style.dart';

import 'package:nearme_app/core/Icons/arrow_back.dart';

class ChangePassword2 extends StatelessWidget {
  const ChangePassword2({super.key});

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
                      hintText: 'Old Password',
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
*/
import 'package:flutter/material.dart';

class ChangePassword2 extends StatefulWidget {
  const ChangePassword2({Key? key}) : super(key: key);

  @override
  State<ChangePassword2> createState() => _ChangePassword2State();
}

class _ChangePassword2State extends State<ChangePassword2> {
  bool isOldPasswordVisible = false;
  bool isNewPasswordVisible = false;

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
              // Old Password TextField
              Positioned(
                top: 297,
                left: 91,
                child: SizedBox(
                  width: 200,
                  child: TextField(
                    obscureText: !isOldPasswordVisible,
                    decoration: const InputDecoration(
                      hintText: 'Old Password',
                      hintStyle: TextStyle(fontSize: 16, color: Colors.grey),
                      border: InputBorder.none,
                      isDense: true,
                    ),
                    textAlign: TextAlign.left,
                  ),
                ),
              ),

              // Old Password Visibility Toggle
              Positioned(
                top: 297,
                left: 320,
                child: GestureDetector(
                  onTap: () {
                    setState(() {
                      isOldPasswordVisible = !isOldPasswordVisible;
                    });
                  },
                  child: Icon(
                    isOldPasswordVisible
                        ? Icons.visibility_outlined
                        : Icons.visibility_off_outlined,
                    color: Colors.grey,
                  ),
                ),
              ),

              // New Password TextField
              Positioned(
                top: 389,
                left: 90,
                child: SizedBox(
                  width: 200,
                  child: TextField(
                    obscureText: !isNewPasswordVisible,
                    decoration: const InputDecoration(
                      hintText: 'New Password',
                      hintStyle: TextStyle(fontSize: 16, color: Colors.grey),
                      border: InputBorder.none,
                      isDense: true,
                    ),
                    textAlign: TextAlign.left,
                  ),
                ),
              ),

              // New Password Visibility Toggle
              Positioned(
                top: 389,
                left: 320,
                child: GestureDetector(
                  onTap: () {
                    setState(() {
                      isNewPasswordVisible = !isNewPasswordVisible;
                    });
                  },
                  child: Icon(
                    isNewPasswordVisible
                        ? Icons.visibility_outlined
                        : Icons.visibility_off_outlined,
                    color: Colors.grey,
                  ),
                ),
              ),

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
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          color: Colors.black,
                        ),
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
