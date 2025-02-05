import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:nearme_app/Features/Map_After_SignUp/Screens/map1.dart';
import 'package:nearme_app/Features/auth/Sign_up_and_in/screens/sign_in_screen.dart';
import 'package:nearme_app/core/constants.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../components/confirm_message_widget.dart';
import '../components/icon_and_text_widget.dart';

import 'package:flutter/material.dart';

class SettingsScreen extends StatelessWidget {
  static String settingsScreenKey = '/SettingsScreen';
  double spaceBetweenRows = 40;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kBackgroundColor,
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: kBackgroundColor,
        centerTitle: true,
        title: const Text(
          'Settings',
          style: TextStyle(
            color: kFontColor,
            fontSize: 40,
            fontWeight: FontWeight.w400,
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(height: spaceBetweenRows),
            // Non-expandable widget
            IconAndTextWidget(
              iconData: Icons.location_on_outlined,
              text: 'Add Place',
              iconSize: 30,
              fontSize: 24,
              onTap: () {
                Navigator.pushNamed(context, Map1.map1Key);
              },
            ),
            SizedBox(height: spaceBetweenRows),
            // Expandable widget
            IconAndTextWidget(
              iconData: Icons.warning_amber_outlined,
              text: 'Quick Risk Alert',
              iconSize: 30,
              fontSize: 24,
              isExpandable: true,
              expandedContent: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: const [
                  Text('Risk Type 1'),
                  Text('Risk Type 2'),
                  Text('Risk Type 3'),
                ],
              ),
            ),
            SizedBox(height: spaceBetweenRows),
            // Non-expandable widget
            IconAndTextWidget(
              iconData: Icons.share_outlined,
              text: 'Share',
              iconSize: 30,
              fontSize: 24,
              onTap: () {
                // Navigate to another screen
              },
            ),
            SizedBox(height: spaceBetweenRows),
            IconAndTextWidget(
              iconData: Icons.copy_outlined,
              text: 'Copy Link To Clipboard',
              iconSize: 30,
              fontSize: 24,
              onTap: () {},
            ),
            SizedBox(height: spaceBetweenRows),
            IconAndTextWidget(
              iconData: Icons.qr_code_2_outlined,
              text: 'QR Code',
              iconSize: 30,
              fontSize: 24,
              onTap: () {},
            ),
            SizedBox(height: spaceBetweenRows),
            IconAndTextWidget(
              iconData: Icons.lock_outline,
              text: 'Password',
              iconSize: 30,
              fontSize: 24,
              onTap: () {},
            ),
            SizedBox(height: spaceBetweenRows),
            IconAndTextWidget(
              iconData: Icons.perm_device_information_sharp,
              text: 'Permissions',
              iconSize: 30,
              fontSize: 24,
              onTap: () {
                Navigator.pushNamed(context, '/permissions');
              },
            ),
            SizedBox(height: spaceBetweenRows),
            IconAndTextWidget(
              iconData: Icons.delete_forever_outlined,
              text: 'Delete Account',
              iconSize: 30,
              fontSize: 24,
              onTap: () {
                showDialog(
                  context: context,
                  builder: (BuildContext context) {
                    return ConfirmMessageWidget(
                      message:
                          'Are you sure you want to delete your account forever?',
                      onCancel: () {
                        Navigator.of(context).pop(); // Close the dialog
                      },
                      onConfirm: () {
                        // Add your logout logic here
                      },
                    );
                  },
                );
              },
            ),
            SizedBox(height: spaceBetweenRows),
            IconAndTextWidget(
              iconData: Icons.logout_outlined,
              text: 'Logout',
              iconSize: 30,
              fontSize: 24,
              onTap: () {
                showDialog(
                  context: context,
                  builder: (BuildContext context) {
                    return ConfirmMessageWidget(
                      message: 'Are you sure you want to leave?',
                      onCancel: () {
                        Navigator.of(context).pop();
                      },
                      onConfirm: () async {
                        SharedPreferences sharedPreferences =
                            await SharedPreferences.getInstance();
                        sharedPreferences.clear();
                        await FirebaseAuth.instance.signOut();

                        GoogleSignIn googleSignIn = GoogleSignIn();
                        // googleSignIn.disconnect();
                        FirebaseAuth.instance.signOut();
                        // ignore: use_build_context_synchronously
                        Navigator.popAndPushNamed(
                            context, SignInScreen.signInScreenKey);
                      },
                    );
                  },
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
