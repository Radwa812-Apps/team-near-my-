import 'package:flutter/material.dart';
import 'package:nearme_app/Features/auth/Forgot_password/components/circle_indicator.dart';
import 'package:nearme_app/Features/auth/Forgot_password/components/custom_text_field.dart';
import 'package:nearme_app/core/Icons/arrow_back.dart';
import 'package:nearme_app/core/font_style.dart';

class ConfirmPassword extends StatelessWidget {
  ConfirmPassword({super.key});

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
      backgroundColor: const Color.fromRGBO(253, 253, 253, 1),
      body: SingleChildScrollView(
        child: Center(
          child: SizedBox(
            width: 393,
            height: 852,
            child: Stack(
              children: <Widget>[
                const ArrowBack(
                  top: 85,
                  left: 40,
                ),
                Positioned(
                  top: 454,
                  left: 44,
                  child: GestureDetector(
                    onTap: () {
                      if (_validateCode(context)) {
                        Navigator.pushNamed(context, 'ChangePassword');
                      }
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
                          'Confirm',
                          style: TextStyles.forgotPasswordButtonText,
                        ),
                      ),
                    ),
                  ),
                ),
                const Positioned(
                  top: 343,
                  left: 60,
                  child: CircleIndicator(),
                ),
                const Positioned(
                  top: 343,
                  left: 137,
                  child: CircleIndicator(),
                ),
                const Positioned(
                  top: 343,
                  left: 214,
                  child: CircleIndicator(),
                ),
                const Positioned(
                  top: 343,
                  left: 282,
                  child: CircleIndicator(),
                ),
                Positioned(
                  top: 348,
                  left: 68,
                  child: CustomTextField(
                    controller: _controllers[0],
                    currentFocus: _focusNodes[0],
                    nextFocus: _focusNodes[1],
                  ),
                ),
                Positioned(
                  top: 348,
                  left: 145,
                  child: CustomTextField(
                    controller: _controllers[1],
                    currentFocus: _focusNodes[1],
                    nextFocus: _focusNodes[2],
                  ),
                ),
                Positioned(
                  top: 348,
                  left: 223,
                  child: CustomTextField(
                    controller: _controllers[2],
                    currentFocus: _focusNodes[2],
                    nextFocus: _focusNodes[3],
                  ),
                ),
                Positioned(
                  top: 348,
                  left: 292,
                  child: CustomTextField(
                    controller: _controllers[3],
                    currentFocus: _focusNodes[3],
                    nextFocus: null,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
