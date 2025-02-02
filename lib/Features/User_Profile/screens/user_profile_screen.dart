import 'package:flutter/material.dart';
import 'package:nearme_app/components/bottom_bar.dart';
import 'package:nearme_app/core/constants.dart';

import '../../../../core/data/models/userRadwa.dart';
import '../components/user_profile_all_info_widget.dart';

class UserProfileScreen extends StatelessWidget {
  static String userProfileScreenKey = '/UserProfileScreen';
  bool showThreeDotsWidget = false;

  User user = User();

  @override
  Widget build(BuildContext context) {
    // double screenHeight = MediaQuery.of(context).size.height;
    double screenWidth = MediaQuery.of(context).size.width;

    double spaceWithRows = screenWidth * 0.08;

    return Scaffold(
      backgroundColor: kBackgroundColor,
      body: Column(
        children: [
          const SizedBox(height: 90),
          UserProfileAll_InfoWidget(
            firstName: user.firstName,
            spaceWithRows: spaceWithRows,
            lastName: user.lastName,
            phoneNumber: user.phoneNumber,
            email: user.email,
            birthDate: user.birthDate,
            paddingTopContainer: 40,
            imagePositionTop: -20,
          ),
        ],
      ),
    );
  }
}
