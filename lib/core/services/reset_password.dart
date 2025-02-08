import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:nearme_app/Features/auth/Sign_up_and_in/screens/sign_in_screen.dart';
import 'package:nearme_app/core/services/internet_connection.dart';
import '../messages.dart';

Future<void> sendPasswordResetEmail({
  required BuildContext context,
  required String emailController,
}) async {
  bool isConnected = await checkConnection();
  if (!isConnected) {
    // ignore: use_build_context_synchronously
    AppMessages().sendVerification(
      context,
      Colors.red.withOpacity(0.8),
      'No internet connection. Please check your network.',
    );

    return;
  }

  try {
    final email = emailController.trim();

    if (email.isEmpty) {
      // ignore: use_build_context_synchronously
      AppMessages().sendVerification(
        context,
        Colors.red.withOpacity(0.8),
        'Please enter your email.',
      );
      return;
    }

    await FirebaseAuth.instance.sendPasswordResetEmail(email: email);

    // ignore: use_build_context_synchronously
    AppMessages().sendVerification(
      context,
      Colors.green.withOpacity(0.8),
      'A password reset link has been sent to your email. Please check your inbox.',
    );
    await Future.delayed(const Duration(seconds: 3));
    // ignore: use_build_context_synchronously
    Navigator.pushNamed(context, SignInScreen.signInScreenKey);
  } catch (e) {
    // ignore: use_build_context_synchronously
    AppMessages().sendVerification(
      context,
      Colors.red.withOpacity(0.8),
      e.toString(),
    );
  }
}
