/*import 'package:flutter/material.dart';

import '../../../../helper/date_picker_helper.dart';
import '../components/bold_text_widget.dart';
import '../components/facebook_google_widget.dart';
import '../components/have_an_account_widget.dart';
import '../components/linear_gradient_widget.dart';
import '../components/or_widget.dart';
import '../components/submit_button.dart';

import '../components/text_form_widget.dart';

class SignUpScreen extends StatefulWidget {
  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  double space = 30;
  final TextEditingController _dateController =
      TextEditingController(); // Declare and initialize the controller

  @override
  void dispose() {
    _dateController.dispose(); // Dispose the controller to avoid memory leaks
    super.dispose();
  }

  GlobalKey<FormState> formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          // Gradient background
          NearMeGradientColor(),
          // Content on top of the gradient
          Form(
            key: formKey,
            child: Expanded(
              child: SingleChildScrollView(
                child: ConstrainedBox(
                  constraints: BoxConstraints(
                    maxHeight: MediaQuery.of(context).size.height,
                  ),
                  child: ListView(
                    shrinkWrap: true,
                    physics: const BouncingScrollPhysics(),
                    children: [
                      Center(
                        child: BoldTextWidget(
                          name: 'Sign Up',
                        ),
                      ),
                      SizedBox(height: 20),
                      TextFormFieldWidget(
                        hint: 'Name',
                        prefixIcon: const Icon(Icons.person_2_outlined,
                            color: Colors.white),
                        keyboardType: TextInputType.text,
                      ),
                      const SizedBox(height: 30),
                      TextFormFieldWidget(
                        hint: 'Email',
                        prefixIcon: const Icon(Icons.email_outlined,
                            color: Colors.white),
                        keyboardType: TextInputType.emailAddress,
                      ),
                      const SizedBox(height: 30),
                      TextFormFieldWidget(
                        hint: 'BirthDate',
                        prefixIcon: const Icon(Icons.edit_calendar_rounded,
                            color: Colors.white),
                        isBirthDate: true, // Enable birthdate functionality
                        controller: _dateController, // Pass the controller
                        onTap: () async {
                          await selectDate(context,
                              _dateController); // Call the utility function
                          setState(() {}); // Trigger a rebuild to update the UI
                        },
                      ),
                      const SizedBox(height: 30),
                      TextFormFieldWidget(
                        hint: 'Phone',
                        prefixIcon: const Icon(Icons.phone_outlined,
                            color: Colors.white),
                        keyboardType: TextInputType.number,
                      ),
                      const SizedBox(height: 30),
                      TextFormFieldWidget(
                        hint: 'Password',
                        prefixIcon:
                            const Icon(Icons.lock_outline, color: Colors.white),
                        keyboardType: TextInputType.text,
                        isPassword: true,
                      ),
                      const SizedBox(height: 30),
                      TextFormFieldWidget(
                        hint: 'Confirm Password',
                        prefixIcon:
                            const Icon(Icons.lock_outline, color: Colors.white),
                        keyboardType: TextInputType.text,
                        isPassword: true,
                      ),
                      const SizedBox(height: 30),
                      SubmitButton(
                        name: 'Sign Up',
                        onTap: () {
                          if (formKey.currentState!.validate()) {
                            print('Validated');
                          } else {}
                        },
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
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
*/
import 'package:flutter/material.dart';

import '../../../../helper/date_picker_helper.dart';
import '../components/bold_text_widget.dart';
import '../components/facebook_google_widget.dart';
import '../components/have_an_account_widget.dart';
import '../components/linear_gradient_widget.dart';
import '../components/or_widget.dart';
import '../components/submit_button.dart';
import '../components/text_form_widget.dart';

class SignUpScreen extends StatefulWidget {
  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  double space = 30;
  final TextEditingController _dateController = TextEditingController();

  @override
  void dispose() {
    _dateController.dispose();
    super.dispose();
  }

  GlobalKey<FormState> formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          // Gradient background
          NearMeGradientColor(),

          // Content on top of the gradient
          Positioned.fill(
            child: SingleChildScrollView(
              child: ConstrainedBox(
                constraints: BoxConstraints(
                  minHeight: MediaQuery.of(context).size.height,
                ),
                child: Form(
                  key: formKey,
                  child: Column(
                    children: [
                      const SizedBox(height: 60), // Adjust spacing as needed
                      Center(
                        child: BoldTextWidget(
                          name: 'Sign Up',
                        ),
                      ),
                      const SizedBox(height: 20),
                      TextFormFieldWidget(
                        hint: 'Name',
                        prefixIcon: const Icon(Icons.person_2_outlined,
                            color: Colors.white),
                        keyboardType: TextInputType.text,
                      ),
                      const SizedBox(height: 30),
                      TextFormFieldWidget(
                        hint: 'Email',
                        prefixIcon: const Icon(Icons.email_outlined,
                            color: Colors.white),
                        keyboardType: TextInputType.emailAddress,
                      ),
                      const SizedBox(height: 30),
                      TextFormFieldWidget(
                        hint: 'BirthDate',
                        prefixIcon: const Icon(Icons.edit_calendar_rounded,
                            color: Colors.white),
                        isBirthDate: true,
                        controller: _dateController,
                        onTap: () async {
                          await selectDate(context, _dateController);
                          setState(() {});
                        },
                      ),
                      const SizedBox(height: 30),
                      TextFormFieldWidget(
                        hint: 'Phone',
                        prefixIcon: const Icon(Icons.phone_outlined,
                            color: Colors.white),
                        keyboardType: TextInputType.number,
                      ),
                      const SizedBox(height: 30),
                      TextFormFieldWidget(
                        hint: 'Password',
                        prefixIcon:
                            const Icon(Icons.lock_outline, color: Colors.white),
                        keyboardType: TextInputType.text,
                        isPassword: true,
                      ),
                      const SizedBox(height: 30),
                      TextFormFieldWidget(
                        hint: 'Confirm Password',
                        prefixIcon:
                            const Icon(Icons.lock_outline, color: Colors.white),
                        keyboardType: TextInputType.text,
                        isPassword: true,
                      ),
                      const SizedBox(height: 30),
                      SizedBox(
                        width: 400,
                        child: SubmitButton(
                          name: 'Sign Up',
                          onTap: () {
                            if (formKey.currentState!.validate()) {
                              print('Validated');
                            }
                          },
                        ),
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
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
