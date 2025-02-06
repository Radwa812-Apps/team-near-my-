import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:nearme_app/Features/auth/Forgot_password/Screens/change_password2.dart';

import '../../Features/auth/Forgot_password/Screens/send_email_for_pass.dart';

Future resetPassword(
    {required BuildContext context, required String email}) async {
  final _auth = FirebaseAuth.instance;
  await _auth.sendPasswordResetEmail(email: email).then((value) {
    Navigator.pushNamed(context, PasswordResetPage.passwordResetPageKey);
  }).catchError((e) {
    throw e.toString();
  });
}
