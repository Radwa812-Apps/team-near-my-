import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
import 'package:nearme_app/Features/Auth/Sign_up_and_in/components/facebook_google_widget.dart';
import 'package:nearme_app/Features/Home/Screens/home_screen.dart';
import 'package:nearme_app/Features/Map_After_SignUp/Screens/map1.dart';
import 'package:nearme_app/Features/auth/Forgot_password/Screens/forgot_password.dart';
import 'package:nearme_app/Features/auth/Sign_up_and_in/screens/sign_up_screen.dart';
import 'package:nearme_app/core/data/bloc/Auth/auth_bloc.dart';
import 'package:nearme_app/core/services/validator.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../../core/constants.dart';
import '../../../../core/services/signInWithGoogle.dart';
import '../../../../core/messages.dart';
import '../components/bold_text_widget.dart';
import '../components/linear_gradient_widget.dart';
import '../components/or_widget.dart';
import '../components/submit_button.dart';
import '../components/text_form_widget.dart';

class SignInScreen extends StatefulWidget {
  @override
  State<SignInScreen> createState() => _SignInScreenState();

  static const String signInScreenKey = '/SignInScreen';
}

class _SignInScreenState extends State<SignInScreen> {
  double space = 30;

  TextEditingController _emailController = TextEditingController();

  TextEditingController _passwordController = TextEditingController();

  GlobalKey<FormState> formKey = GlobalKey<FormState>();

  String? email, password;

  bool isload = false;

  bool? rememberMe = false;

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AuthBloc, AuthState>(
      listener: (context, state) {
        if (state is LoginSuccess) {
          Navigator.pushNamed(context, Map1.map1Key);
          // Navigator.pushNamed(context, '/shimass');
        } else if (state is LoginError) {
          isload = false;
          AppMessages().sendVerification(
              (context), Colors.red.withOpacity(0.8), state.loginError);
        } else {
          isload = true;
        }
      },
      builder: (context, state) {
        return ModalProgressHUD(
          inAsyncCall: isload,
          child: Scaffold(
            body: Stack(
              children: [
                NearMeGradientColor(),
                Form(
                  key: formKey,
                  child: ListView(
                    physics: const BouncingScrollPhysics(),
                    children: [
                      const SizedBox(height: 20),
                      const Center(
                        child: BoldTextWidget(
                          name: 'Sign In',
                        ),
                      ),
                      const SizedBox(height: 100),
                      TextFormFieldWidget(
                        controller: _emailController,
                        hint: 'Email',
                        prefixIcon: const Icon(Icons.email_outlined,
                            color: Colors.white),
                        keyboardType: TextInputType.emailAddress,
                        validatior: ((p0) {
                          if (p0 == null || p0.isEmpty) {
                            return "Email is required.";
                          }
                          return null;
                        }),
                        onchange: ((p0) {
                          email = p0;
                        }),
                      ),
                      const SizedBox(height: 30),
                      TextFormFieldWidget(
                        controller: _passwordController,
                        hint: 'Password',
                        prefixIcon:
                            const Icon(Icons.lock_outline, color: Colors.white),
                        keyboardType: TextInputType.text,
                        isPassword: true,
                        validatior: ((p0) {
                          if (p0 == null || p0.isEmpty) {
                            return "PassWord is required.";
                          }
                          return null;
                        }),
                        onchange: ((p0) {
                          password = p0;
                        }),
                      ),
                      const SizedBox(height: 10),
                      CheckboxListTile(
                        title: const Text(
                          'Remember Me',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 16,
                            fontFamily: kFontBold,
                          ),
                        ),
                        value: rememberMe,
                        onChanged: (value) {
                          setState(() {
                            rememberMe = value;
                          });
                          keppUserLogIn(value ?? false);
                        },
                        controlAffinity: ListTileControlAffinity.leading,
                        activeColor: kSpecialColor,
                        checkColor: Colors.white,
                        side: const BorderSide(
                          color: Colors.white,
                          width: 2,
                        ),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(4),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 200),
                        child: TextButton(
                          onPressed: () {
                            Navigator.pushNamed(
                                context, ForgotPassword.forgotPasswordKey);
                          },
                          child: const Text(
                            "Forget Password?",
                            style: TextStyle(
                              color: kSpecialColor,
                              fontSize: 20,
                              fontFamily: kFontBold,
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(height: 30),
                      SubmitButton(
                        name: 'Sign In',
                        onTap: () {
                          if (rememberMe == true) {
                            keppUserLogIn(rememberMe!);
                          }

                          if (formKey.currentState!.validate()) {
                            BlocProvider.of<AuthBloc>(context)
                                .add(LoginEvent(email!, password!));
                          } else {}
                        },
                      ),
                      const SizedBox(height: 10),
                      const ORWediget(
                        oRsize: 20,
                        lineWidth: 80,
                      ),
                      const SizedBox(height: 20),
                      SocialAuthWidget(),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Text(
                            "Don't have an account?",
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 18,
                              fontFamily: kFontBold,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          TextButton(
                            onPressed: () {
                              Navigator.pushNamed(
                                  context, SignUpScreen.signUpScreenKey);
                            },
                            child: const Text(
                              "Sign Up",
                              style: TextStyle(
                                color: kSpecialColor,
                                fontSize: 18,
                                fontFamily: kFontBold,
                              ),
                            ),
                          ),
                        ],
                      )
                    ],
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  void keppUserLogIn(bool value) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setBool('KeppUserLogIn', value);
  }
}

// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:flutter/cupertino.dart';

// class GetUserName extends StatelessWidget {


//   @override
//   Widget build(BuildContext context) {
//     CollectionReference users = FirebaseFirestore.instance.collection('customPlaces');

//     return FutureBuilder<DocumentSnapshot>(
//       future: users.doc('r0zgKcay7O1tO7RS8fXM').get(),
//       builder:
//           (BuildContext context, AsyncSnapshot<DocumentSnapshot> snapshot) {

//         if (snapshot.hasError) {
//           return Text("Something went wrong");
//         }

//         if (snapshot.hasData && !snapshot.data!.exists) {
//           return Text("Document does not exist");
//         }

//         if (snapshot.connectionState == ConnectionState.done) {
//           Map<String, dynamic> data = snapshot.data!.data() as Map<String, dynamic>;
//           return Text("latitude: ${data['latitude']} longitude: ${data['longitude']}");
//         }

//         return Text("loading");
//       },
//     );
//   }
// }