import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:nearme_app/core/data/models/user.dart';
import 'package:nearme_app/core/messages.dart';
import 'package:sign_in_button/sign_in_button.dart';
import '../../components/mainScaffold.dart';
import '../constants.dart';
import 'handleFirebaseAuthException.dart';
import 'internet_connection.dart';

class SocialAuthWidget extends StatefulWidget {
  @override
  _SocialAuthWidgetState createState() => _SocialAuthWidgetState();
}

class _SocialAuthWidgetState extends State<SocialAuthWidget> {
  bool isLoading = false;

  Future<void> signInWithGoogle(BuildContext context) async {
    setState(() {
      isLoading = true;
    });

    if (!await checkConnection()) {
      if (mounted) {
        setState(() {
          isLoading = false;
        });
      }
      return;
    }

    try {
      final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();
      if (googleUser == null) {
        if (mounted) {
          setState(() {
            isLoading = false;
          });
        }
        return;
      }

      final GoogleSignInAuthentication? googleAuth =
          await googleUser.authentication;
      final credential = GoogleAuthProvider.credential(
        accessToken: googleAuth?.accessToken,
        idToken: googleAuth?.idToken,
      );

      UserCredential user =
          await FirebaseAuth.instance.signInWithCredential(credential);
      print(user.additionalUserInfo!.username);
      // Navigator.pushNamed(context, HomeScreen.homeScreenKey);
      Navigator.pushReplacementNamed(context, MainScaffold.mainScaffoldKey);

      await addUserToFirestore(user, context);
    } on FirebaseException catch (e) {
      print('FirebaseException: $e');
      handleFirebaseException(e, context);
    } on FirebaseAuthException catch (e) {
      print('FirebaseAuthException: $e');
      handleFirebaseAuthException(e, context);
    } on PlatformException catch (e) {
      print('PlatformException: $e');
      handlePlatformException(e, context);
    } catch (e) {
      print('Unknown Exception: $e');
      handleUnknownException(e, context);
    } finally {
      if (mounted) {
        setState(() {
          isLoading = false;
        });
      }
    }
  }

  Future<void> addUserToFirestore(
      UserCredential user, BuildContext context) async {
    try {
      if (user != null) {
        UserModel userObject =
            UserModel.fromUserCredential(userCredential: user);
        FirebaseFirestore firestore = FirebaseFirestore.instance;
        await firestore
            .collection('users')
            .doc(userObject.id)
            .set(userObject.toJson());
      }
      print("User added to Firestore successfully.");
    } catch (e, stacktrace) {
      print('Error during Google Sign-In: $e');
      print('Stacktrace: $stacktrace');
      AppMessages().sendVerification(context, Colors.red.withOpacity(0.8),
          'Error during Google Sign-In: $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Stack(
          alignment: Alignment.center,
          children: [
            SizedBox(
              width: 220.w,
              height: 45.h,
              child: SignInButton(
                Buttons.google,
                onPressed: () {
                  signInWithGoogle(context);
                },
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(50),
                ),
                elevation: 5,
              ),
            ),
            if (isLoading)
              const CircularProgressIndicator(
                color: kPrimaryColor1,
              ),
          ],
        ),
      ],
    );
  }
}
