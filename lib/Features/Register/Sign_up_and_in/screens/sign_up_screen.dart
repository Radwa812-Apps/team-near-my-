import 'package:flutter/material.dart';

import '../components/bold_text_widget.dart';
import '../components/facebook_google_widget.dart';
import '../components/have_an_account_widget.dart';
import '../components/linear_gradient_widget.dart';
import '../components/or_widget.dart';
import '../components/submit_button.dart';

import '../components/text_form_widget.dart';

class SignUpScreen extends StatelessWidget {
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
              Center(
                child: BoldTextWidget(
                  name: 'Sign Up',
                ),
              ),
              SizedBox(height: 20),
              TextFormFieldWidget2(
                hint: 'Name',
                prefixIcon:
                    const Icon(Icons.person_2_outlined, color: Colors.white),
                keyboardType: TextInputType.text,
              ),
              const SizedBox(height: 30),
              TextFormFieldWidget2(
                hint: 'Email',
                prefixIcon:
                    const Icon(Icons.email_outlined, color: Colors.white),
                keyboardType: TextInputType.emailAddress,
              ),
              const SizedBox(height: 30),
              TextFormFieldWidget2(
                hint: 'Date Of Birth',
                prefixIcon: const Icon(Icons.edit_calendar_rounded,
                    color: Colors.white),
                keyboardType: TextInputType.datetime,
              ),
              const SizedBox(height: 30),
              TextFormFieldWidget2(
                hint: 'Phone',
                prefixIcon:
                    const Icon(Icons.phone_outlined, color: Colors.white),
                keyboardType: TextInputType.number,
              ),
              const SizedBox(height: 30),
              TextFormFieldWidget2(
                hint: 'Password',
                prefixIcon: const Icon(Icons.lock_outline, color: Colors.white),
                keyboardType: TextInputType.text,
                isPassword: true,
              ),
              const SizedBox(height: 30),
              TextFormFieldWidget2(
                hint: 'Confirm Password',
                prefixIcon: const Icon(Icons.lock_outline, color: Colors.white),
                keyboardType: TextInputType.text,
                isPassword: true,
              ),
              const SizedBox(height: 30),
              SubmitButton(
                name: 'Sign Up',
                onTap: () {},
              ),
              const SizedBox(height: 10),
              ORWediget(
                oRsize: 13.43,
                lineWidth: 80,
              ),
              const SizedBox(height: 10),
              FacebookGoogleWidget(),
              const SizedBox(height: 20),
              HaveAnAccountWidget(),
            ],
          ),
        ],
      ),
    );
  }
}
