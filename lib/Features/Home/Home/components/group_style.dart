import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:nearme_app/Features/Notifications/Screens/group_notifications.dart';
import 'package:nearme_app/core/constants.dart';

import '../../../Group_Profile/screens/group_profile_screen.dart';
import 'round_image_widget.dart';

class GroupStyle extends StatelessWidget {
  final String? groupName;

  const GroupStyle({super.key, this.groupName});

  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;
    double screenWidth = MediaQuery.of(context).size.width;

    double spaceWithRows = screenWidth * 0.07;
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: kPrimaryColor1.withOpacity(.20),
      ),
      width: screenWidth * .2,
      height: screenHeight * .1,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 8, right: 8),
            child: Row(
              children: [
                GestureDetector(
                  onTap: (() {
                    Navigator.pushNamed(
                        context, GroupProfileScreen.groupProfileScreenKey);
                  }),
                  child: RoundImageWidget(
                      name: 'assets/images/group.jpg',
                      width: screenWidth * .14,
                      height: screenHeight * .07),
                ),
                const SizedBox(width: 20),
                Expanded(
                  child: Text(
                    groupName ?? '',
                    style: const TextStyle(
                      fontSize: 20,
                      fontFamily: kFontRegular,
                      color: kFontColor,
                    ),
                    overflow:
                        TextOverflow.ellipsis, // Ensures text doesn't overflow
                  ),
                ),
                const SizedBox(width: 8),
                IconButton(
                  onPressed: (() {
                    Navigator.pushNamed(
                        context, GroupNotifications.groupNotificationsKey);
                  }),
                  icon: const Icon(
                    Icons.notifications_outlined,
                    size: 30,
                    color: kPrimaryColor1,
                  ),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
