import 'package:flutter/material.dart';
import 'package:nearme_app/Features/Register/Forgot_password/Screens/change_password.dart';
import 'package:nearme_app/Features/Register/Forgot_password/Screens/change_password2.dart';
import 'package:nearme_app/Features/Register/Forgot_password/Screens/forgot_password.dart';
import 'package:nearme_app/Features/Register/Sign_up_and_in/screens/sign_up_screen.dart';

import 'Features/Home/Screens/home_screen.dart';

import 'Features/Map_After_SignUp/Screens/map1.dart';
import 'Features/Permissions/Screens/permission_location.dart';
import 'Features/Permissions/Screens/permissions.dart';
import 'Features/Register/Forgot_password/Screens/confirm_password.dart';
import 'Features/Register/Sign_up_and_in/screens/sign_in_screen.dart';
// Use only one import path

void main() {
  runApp(const NearMeApp());
}

class NearMeApp extends StatelessWidget {
  const NearMeApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      routes: {
        'SignUpScreen': (context) => SignUpScreen(),
        'SignInScreen': (context) => SignInScreen(),
        'ChangePassword': (context) => ChangePassword(),
        'ConfirmPassword': (context) => ConfirmPassword(),
        'ChangePassword2': (context) => ChangePassword2(),
        'ForgotPassword': (context) => ForgotPassword(),
        'HomeScreen': (context) => HomeScreen(),
        'Map1': (context) => Map1(),
        'PermissionLocation': (context) => PermissionLocation(),
        'Permissions': (context) => Permissions(),
      },
      initialRoute: 'Permissions',
    );
  }
}
