import 'package:flutter/material.dart';
import 'package:nearme_app/Features/auth/Forgot_password/Screens/confirm_password.dart';
import 'package:nearme_app/core/Icons/arrow_back.dart';
import 'package:nearme_app/core/constants.dart';
import 'package:nearme_app/core/font_style.dart';
import '../../Sign_up_and_in/components/custom_back_button.dart';
import '../../Sign_up_and_in/screens/sign_in_screen.dart';
import '../components/forgot_password_button.dart';

class ForgotPassword extends StatelessWidget {
  ForgotPassword({super.key});
  static const forgotPasswordKey = 'ForgotPassword';
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  @override
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Center(
            child: Padding(
              padding: const EdgeInsets.only(bottom: 150, left: 10),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Center(
                    child: Image.asset(
                      'assets/images/image.png',
                      height: 350,
                      width: 350,
                    ),
                  ),
                  const SizedBox(height: 20),
                  const Padding(
                    padding: EdgeInsets.only(left: 15),
                    child: Text(
                      'Forget Password?',
                      style:
                          TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
                      textAlign: TextAlign.start,
                    ),
                  ),
                  const SizedBox(height: 10),
                  const Padding(
                    padding: EdgeInsets.only(left: 15),
                    child: Text(
                      'Please enter your email or phone number to reset password',
                      style: TextStyle(fontSize: 14, color: Colors.grey),
                      maxLines: 3,
                      textAlign: TextAlign.start,
                    ),
                  ),
                  const SizedBox(height: 30),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 15),
                    child: TextFormField(
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
                          borderSide: BorderSide(
                            color: Colors.grey,
                            width: 0.25,
                          ),
                        ),
                        focusedBorder: UnderlineInputBorder(
                          borderSide: BorderSide(
                            color: kPrimaryColor1,
                            width: 0.5,
                          ),
                        ),
                      ),
                      style: TextStyles.forgotPasswordText,
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
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
                            context, ConfirmPassword.confirmPasswordKey);
                      },
                      child: const Text(
                        'Send Code',
                        style: TextStyle(
                            fontSize: 20, fontWeight: FontWeight.bold),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          CustomBackButton(
            ontap: () {
              // FirebaseAuth.instance.signOut();
              Navigator.pushNamed(context, SignInScreen.signInScreenKey);
            },
            icon: Icons.arrow_back_ios_outlined,
          ),
        ],
      ),
    );
  }
}
   // Scaffold(
    //   backgroundColor: background,
    //   body: Form(
    //     key: formKey,
    //     child: Column(
    //       crossAxisAlignment: CrossAxisAlignment.start,
    //       children: [
    //         const SizedBox(
    //           height: 40,
    //         ),
    //         Stack(
    //           children: [
    //             Center(
    //               child: Image.asset(
    //                 'assets/images/image.png',
    //                 height: 300,
    //               ),
    //             ),
    //             Container(
    //               height: 35,
    //               width: 35,
    //               margin: const EdgeInsets.all(20.0),
    //               decoration: const BoxDecoration(
    //                   color: Color.fromARGB(255, 185, 179, 172),
    //                   shape: BoxShape.circle),
    //               child: const Icon(
    //                 Icons.arrow_back_ios_rounded,
    //               ),
    //             ),
    //           ],
    //         ),
    //         const Padding(
    //           padding: EdgeInsets.symmetric(horizontal: 15),
    //           child: Text(
    //             'Forget Password?',
    //             style: TextStyle(fontSize: 25, fontFamily: 'OpenSans-Bold'),
    //           ),
    //         ),
    //         const SizedBox(
    //           height: 5,
    //         ),
    //         const Padding(
    //           padding: EdgeInsets.symmetric(horizontal: 15),
    //           child: Text(
    //             'Please enter your email or phone number to reset password',
    //             style: TextStyle(fontSize: 11),
    //           ),
    //         ),
    //         const SizedBox(
    //           height: 20,
    //         ),
    //         Padding(
    //           padding: const EdgeInsets.symmetric(horizontal: 15),
    //           child: TextFormField(
    //             validator: (value) {
    //               if (value == null || value.isEmpty) {
    //                 return "This field is required";
    //               }
    //               return null;
    //             },
    //             decoration: const InputDecoration(
    //               hintText: 'Email / Phone',
    //               hintStyle: TextStyles.forgotPasswordText,
    //               enabledBorder: UnderlineInputBorder(
    //                 borderSide: BorderSide(
    //                   color: kPrimaryColor1,
    //                   width: 0.25,
    //                 ),
    //               ),
    //               focusedBorder: UnderlineInputBorder(
    //                 borderSide: BorderSide(
    //                   color: kPrimaryColor1,
    //                   width: 0.5,
    //                 ),
    //               ),
    //             ),
    //             style: TextStyles.forgotPasswordText,
    //           ),
    //         ),
    //         Padding(
    //           padding: const EdgeInsets.all(15.0),
    //           child: ForgotPasswordButton(
    //             buttonText: 'Send Code',
    //             onTap: () {
    //               if (formKey.currentState!.validate()) {
    //                 Navigator.pushNamed(context, 'ConfirmPassword');
    //               } else {
    //                 print("Validation failed");
    //               }
    //             },
    //           ),
    //         ),
    //       ],
    //     ),
    //   ),
    // );
 