import 'package:flutter/material.dart';

import '../../../core/constants.dart';
import '../Features/Home/Home/components/icon_button_widegt.dart';

class BottomContainerWithIcons extends StatelessWidget {
  final int selectedIndex;
  final Function(int) onIconPressed;
  double space = 35;

  BottomContainerWithIcons({
    required this.selectedIndex,
    required this.onIconPressed,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 65,
      decoration: BoxDecoration(
        color: kPrimaryColor1.withOpacity(.20),
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(18),
          topRight: Radius.circular(18),
        ),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          // Home Icon (Index 0)
          IconButtonWidegt(
            onPressed: () {
              onIconPressed(0); // HomeScreen is at index 0
            },
            icon: selectedIndex == 0 ? Icons.home : Icons.home_outlined,
            size: 35,
          ),
          SizedBox(width: space),
          // User Profile Icon (Index 1)
          IconButtonWidegt(
            onPressed: () {
              onIconPressed(1); // UserProfileScreen is at index 1
            },
            icon: selectedIndex == 1 ? Icons.person : Icons.person_outlined,
            size: 30,
          ),
          SizedBox(width: space),
          // Notifications Icon (Index 2)
          IconButtonWidegt(
            onPressed: () {
              onIconPressed(2); // Notifications screen is at index 2
            },
            icon: selectedIndex == 2
                ? Icons.notifications
                : Icons.notifications_outlined,
            size: 30,
          ),
          SizedBox(width: space),
          // Settings Icon (Index 3)
          IconButtonWidegt(
            onPressed: () {
              onIconPressed(3); // SettingsScreen is at index 3
            },
            icon: selectedIndex == 3 ? Icons.settings : Icons.settings_outlined,
            size: 30,
          ),
        ],
      ),
    );
  }
}
