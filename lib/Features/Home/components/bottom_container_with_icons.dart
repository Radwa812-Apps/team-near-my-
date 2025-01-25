import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:nearme_app/Features/Home/components/icon_button_widegt.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../core/constants.dart';

class BottomContainerWithIcons extends StatelessWidget {
  double space = 35;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 65,
      decoration: BoxDecoration(
        color: kPrimaryColor1.withOpacity(.20),
        borderRadius: const BorderRadius.only(
          topLeft: Radius.circular(18),
          topRight: Radius.circular(18),
        ),
      ),
      child: Row(mainAxisAlignment: MainAxisAlignment.center, children: [
        IconButtonWidegt(
          onPressed: () {},
          icon: Icons.settings_outlined,
          size: 30,
        ),
        SizedBox(width: space),
        IconButtonWidegt(
          onPressed: () {
             GoogleSignIn googleSignIn = GoogleSignIn();
            googleSignIn.disconnect();
            FirebaseAuth.instance.signOut();
            Navigator.popAndPushNamed(context, 'SignInScreen');
          },
          icon: Icons.notifications_outlined,
          size: 30,
        ),
        SizedBox(width: space),
        IconButtonWidegt(
          onPressed: () async {
            SharedPreferences sharedPreferences =
                await SharedPreferences.getInstance();
            sharedPreferences.clear();
            await FirebaseAuth.instance.signOut();
            Navigator.popAndPushNamed(context, 'SignInScreen');
          },
          icon: Icons.person_outlined,
          size: 30,
        ),
        SizedBox(width: space),
        IconButtonWidegt(
          onPressed: () {},
          icon: Icons.home_outlined,
          size: 35,
        ),
      ]),
    );
  }
}
