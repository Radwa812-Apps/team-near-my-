import 'package:flutter/material.dart';

import '../components/bold_text_widget.dart';
import '../components/facebook_google_widget.dart';
import '../components/have_an_account_widget.dart';
import '../components/linear_gradient_widget.dart';
import '../components/or_widget.dart';
import '../components/submit_button.dart';
import '../components/text_form_field_sign_in_up_widget.dart';
import '../components/text_form_password_widget.dart';

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
              TextFormFieldWidegt(
                name: 'Name',
                icon: const Icon(Icons.person_2_outlined, color: Colors.white),
                txt: TextInputType.text,
              ),
              const SizedBox(height: 30),
              TextFormFieldWidegt(
                name: 'Email',
                icon: const Icon(Icons.email_outlined, color: Colors.white),
                txt: TextInputType.emailAddress,
              ),
              const SizedBox(height: 30),
              TextFormFieldWidegt(
                name: 'Date Of Birth',
                icon: const Icon(Icons.edit_calendar_rounded,
                    color: Colors.white),
                txt: TextInputType.datetime,
              ),
              const SizedBox(height: 30),
              TextFormFieldWidegt(
                name: 'Phone',
                icon: const Icon(Icons.phone_outlined, color: Colors.white),
                txt: TextInputType.number,
              ),
              const SizedBox(height: 30),
              TextFormPasswordFieldWidget(
                name: 'Password',
                icon: const Icon(Icons.lock_outline, color: Colors.white),
                suffx: const Icon(Icons.visibility_off_outlined,
                    color: Colors.white),
              ),
              const SizedBox(height: 30),
              TextFormPasswordFieldWidget(
                name: 'Confirm Password',
                icon: const Icon(Icons.check, color: Colors.white),
                suffx: const Icon(Icons.visibility_off_outlined,
                    color: Colors.white),
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
