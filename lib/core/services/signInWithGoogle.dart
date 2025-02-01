// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter/services.dart';
// import 'package:google_sign_in/google_sign_in.dart';
// import 'package:nearme_app/core/data/models/user.dart';
// import 'package:nearme_app/core/data/services/Auth_functions.dart';
// import 'package:nearme_app/core/messages.dart';
// import 'package:internet_connection_checker_plus/internet_connection_checker_plus.dart';

// import 'handleFirebaseAuthException.dart';
// import 'internet_connection.dart';

// class SocialAuthWidget extends StatefulWidget {
//   @override
//   _SocialAuthWidgetState createState() => _SocialAuthWidgetState();
// }

// class _SocialAuthWidgetState extends State<SocialAuthWidget> {
//   bool connection = false;

//   Future<void> signInWithGoogle(BuildContext context) async {
//     setState(() {
//       //  isload = true;
//     });

//     if (!await checkConnection()) {
//       setState(() {
//         // isload = false;
//       });
//       return;
//     }

//     try {
//       final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();
//       if (googleUser == null) {
//         setState(() {
//           // isload = false;
//         });
//         return;
//       }

//       final GoogleSignInAuthentication? googleAuth =
//           await googleUser.authentication;
//       final credential = GoogleAuthProvider.credential(
//         accessToken: googleAuth?.accessToken,
//         idToken: googleAuth?.idToken,
//       );

//       UserCredential user =
//           await FirebaseAuth.instance.signInWithCredential(credential);
//       print(user.additionalUserInfo!.username);
//       Navigator.pushNamed(context, 'HomeScreen');
//       await addUserToFirestore(user, context);
//     } on FirebaseException catch (e) {
//       handleFirebaseException(e, context);
//     } on FirebaseAuthException catch (e) {
//       handleFirebaseAuthException(e, context);
//     } on FirebaseAuthException catch (e) {
//       print('FirebaseException: $e');
//       handleFirebaseAuthException(e, context); // معالجة أخطاء FirebaseAuth

//     } on PlatformException catch (e) {
//       print('PlatformException: $e');
//       handlePlatformException(e, context); // معالجة أخطاء Platform

//     } catch (e) {
//       print('Unexpected Error: $e');
//       handleUnknownException(e, context); // معالجة الأخطاء غير المعروفة

//     } finally {
//       setState(() {
//         // isload = false;
//       });
//     }
//   }

//   Future<void> addUserToFirestore(
//       UserCredential user, BuildContext context) async {
//     try {
//       if (user != null) {
//         UserModel userObject =
//             UserModel.fromUserCredential(userCredential: user);
//         FirebaseFirestore firestore = FirebaseFirestore.instance;
//         await firestore
//             .collection('users')
//             .doc(userObject.id)
//             .set(userObject.toJson());
//       }
//       print("User added to Firestore successfully.");
//     } catch (e, stacktrace) {
//       print('Error during Google Sign-In: $e');
//       print('Stacktrace: $stacktrace');
//       AppMessages().sendVerification(context, Colors.red.withOpacity(0.8),
//           'Error during Google Sign-In: $e');
//     }
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Row(
//       mainAxisAlignment: MainAxisAlignment.center,
//       children: [
//         GestureDetector(
//           onTap: () => signInWithGoogle(context),
//           child: const SizedBox(
//             width: 55, // Set desired width
//             height: 55, // Set desired height
//             child: Image(
//               image: AssetImage('assets/images/google.png'),
//               fit: BoxFit.contain, // Adjust the image fit
//             ),
//           ),
//         ),
//       ],
//     );
//   }
// }






import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:nearme_app/core/data/models/user.dart';
import 'package:nearme_app/core/messages.dart';
import 'package:internet_connection_checker_plus/internet_connection_checker_plus.dart';

import '../constants.dart';
import 'handleFirebaseAuthException.dart';
import 'internet_connection.dart';

class SocialAuthWidget extends StatefulWidget {
  @override
  _SocialAuthWidgetState createState() => _SocialAuthWidgetState();
}

class _SocialAuthWidgetState extends State<SocialAuthWidget> {
  bool isLoading = false; // حالة التحميل

  Future<void> signInWithGoogle(BuildContext context) async {
    setState(() {
      isLoading = true; // بدء التحميل
    });

    if (!await checkConnection()) {
      setState(() {
        isLoading = false; // إيقاف التحميل
      });
      return;
    }

    try {
      final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();
      if (googleUser == null) {
        setState(() {
          isLoading = false; // إيقاف التحميل
        });
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
      Navigator.pushNamed(context, 'HomeScreen');
      await addUserToFirestore(user, context);


    } on FirebaseException catch (e) {
      handleFirebaseException(e, context);
    } on FirebaseAuthException catch (e) {
      handleFirebaseAuthException(e, context);
    } on PlatformException catch (e) {
      handlePlatformException(e, context);
    } catch (e) {
      handleUnknownException(e, context);
    } finally {
      setState(() {
        isLoading = false; // إيقاف التحميل
      });
    }
  }

  Future<void> 
  addUserToFirestore(
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
        GestureDetector(
          onTap: () => signInWithGoogle(context),
          child: Stack(
            alignment: Alignment.center,
            children: [
              const SizedBox(
                width: 55, // Set desired width
                height: 55, // Set desired height
                child: Image(
                  image: AssetImage('assets/images/google.png'),
                  fit: BoxFit.contain, // Adjust the image fit
                ),
              ),
              if (isLoading) // عرض Loading Indicator إذا كان التحميل جاريًا
                const CircularProgressIndicator(
                  color: kPrimaryColor1, // لون الـ Loading Indicator
                ),
            ],
          ),
        ),
      ],
    );
  }
}
