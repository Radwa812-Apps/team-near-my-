import 'package:flutter/material.dart';
import 'package:nearme_app/Features/User%20Profile/components/user_profile_all_info_widget.dart';
import 'package:nearme_app/core/constants.dart';

import '../../../core/data/models/userRadwa.dart';

class UserProfileScreen extends StatelessWidget {
  double spaceWithRows = 35;

  bool showThreeDotsWidget = false;

  User user = User();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kBackgroundColor,
      body: Column(
        children: [
          SizedBox(height: 90),
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
