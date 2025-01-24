import 'package:flutter/material.dart';
import 'package:nearme_app/Features/Register/Forgot_password/components/forgot_password_button.dart';
import 'package:nearme_app/core/Icons/arrow_back.dart'; 
import 'package:nearme_app/core/constants.dart';
import 'package:nearme_app/core/font_style.dart'; 

class ForgotPassword extends StatelessWidget {
  ForgotPassword({super.key});

  final GlobalKey<FormState> formKey = GlobalKey<FormState>(); 

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: background,
      body: Center(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Form(
              key: formKey, 
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const ArrowBack(top: 85, left: 40),

                  const SizedBox(height: 200),

                  
                  TextFormField(
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return "This field is required";
                      }
                      return null;
                    },
                    decoration: const InputDecoration(
                      hintText: 'Email / Phone',
                      hintStyle: TextStyles.forgotPasswordText,
                      enabledBorder: UnderlineInputBorder(
                        borderSide:  BorderSide(
                          color: kPrimaryColor1,
                          width: 0.25,
                        ),
                      ),
                      focusedBorder: UnderlineInputBorder(
                        borderSide:  BorderSide(
                          color: kPrimaryColor1,
                          width: 0.5,
                        ),
                      ),
                    ),
                    style: TextStyles.forgotPasswordText,
                  ),

                  const SizedBox(height: 20),

                  
                  ForgotPasswordButton(
                    buttonText: 'Send Code',
                    onTap: () {
                      
                      if (formKey.currentState!.validate()) {
                       
                        Navigator.pushNamed(
                          context,'ConfirmPassword'
                         
                        );
                      } else {
                        
                        print("Validation failed");
                      }
                    },
                    
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
