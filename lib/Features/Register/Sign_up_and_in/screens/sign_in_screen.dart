import 'package:flutter/material.dart';
import 'package:nearme_app/Features/Register/Sign_up_and_in/components/facebook_google_widget.dart';

import '../../../../core/constants.dart';
import '../components/bold_text_widget.dart';
import '../components/linear_gradient_widget.dart';
import '../components/or_widget.dart';
import '../components/submit_button.dart';
import '../components/text_form_field_sign_in_up_widget.dart';
import '../components/text_form_password_widget.dart';

class SignInScreen extends StatelessWidget {
  double space = 30;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          // Gradient background
          NearMeGradientColor(),
          // Content on top of the gradient
          ListView(
            physics: const BouncingScrollPhysics(),
            children: [
              SizedBox(height: 20),
              Center(
                child: BoldTextWidget(
                  name: 'Sign In',
                ),
              ),
              SizedBox(height: 100),
              TextFormFieldWidegt(
                name: 'Email',
                icon: const Icon(Icons.email_outlined, color: Colors.white),
                txt: TextInputType.emailAddress,
              ),
              const SizedBox(height: 30),
              TextFormPasswordFieldWidget(
                name: 'Password',
                icon: const Icon(Icons.lock_outline, color: Colors.white),
                suffx: const Icon(Icons.visibility_off_outlined,
                    color: Colors.white),
              ),
              SizedBox(height: 10),
              Padding(
                padding: const EdgeInsets.only(left: 150),
                child: TextButton(
                  onPressed: () {
                    Navigator.pushNamed(context, 'ForgotPassword');
                  },
                  child: Text(
                    "Forget Password?",
                    style: TextStyle(
                      color: kSpecialColor, // You can change the color
                      fontSize: 20,
                      fontFamily: 'OpenSans-Bold',
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 30),
              SubmitButton(
                name: 'Sign In',
                onTap: () {},
              ),
              const SizedBox(height: 10),
              ORWediget(
                oRsize: 20,
                lineWidth: 80,
              ),
              const SizedBox(height: 20),
              FacebookGoogleWidget(),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "Don't have an account?",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 18,
                      fontFamily: 'OpenSans-Bold',
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  TextButton(
                    onPressed: () {
                      Navigator.pushNamed(context, 'SignUpScreen');
                    },
                    child: Text(
                      "Sign Up",
                      style: TextStyle(
                        color: kSpecialColor, // You can change the color
                        fontSize: 18,
                        fontFamily: 'OpenSans-Bold',
                      ),
                    ),
                  ),
                ],
              )
            ],
          ),
        ],
      ),
    );
  }
}
