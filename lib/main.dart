import 'package:flutter/material.dart';
import 'package:nearme_app/Features/auth/Forgot_password/Screens/change_password.dart';
import 'package:nearme_app/Features/auth/Forgot_password/Screens/change_password2.dart';
import 'package:nearme_app/Features/auth/Forgot_password/Screens/forgot_password.dart';
import 'package:nearme_app/Features/auth/Sign_up_and_in/screens/sign_up_screen.dart';
import 'package:nearme_app/Features/Splash_page/Screens/splash_screen.dart';

import 'Features/Home/Screens/home_screen.dart';

import 'Features/Map_After_SignUp/Screens/map1.dart';
import 'Features/Permissions/Screens/permission_location.dart';
import 'Features/Permissions/Screens/permissions.dart';
import 'Features/auth/Forgot_password/Screens/confirm_password.dart';
import 'Features/auth/Sign_up_and_in/screens/sign_in_screen.dart';
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
        SignUpScreen.signUpScreenKey: (context) => SignUpScreen(),
        SignInScreen.signInScreenKey: (context) => SignInScreen(),
        ChangePassword.changePasswordKey: (context) => const ChangePassword(),
        ConfirmPassword.confirmPasswordKey: (context) => ConfirmPassword(),
        ChangePassword2.changePassword2Key: (context) =>
            const ChangePassword2(),
        ForgotPassword.forgotPasswordKey: (context) => ForgotPassword(),
        HomeScreen.homeScreenKey: (context) => HomeScreen(),
        Map1.map1Key: (context) => const Map1(),
        PermissionLocation.permissionLocationKey: (context) =>
            PermissionLocation(),
        Permissions.permissionsKey: (context) => const Permissions(),
        SplashPage.splashPageKey: ((context) => SplashPage())
      },
      initialRoute: SplashPage.splashPageKey,
    );
  }
}
