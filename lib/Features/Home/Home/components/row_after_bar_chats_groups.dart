import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../../../../core/constants.dart';
import 'text_after_bar.dart';

class RowAfterBarChatsGroups extends StatelessWidget {
  final String selectedTab;
  final Function(String) onTabSelected;
  const RowAfterBarChatsGroups({
    super.key,
    required this.selectedTab,
    required this.onTabSelected,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        GestureDetector(
          onTap: () => onTabSelected('Chats'),
          child: Column(
            children: [
              TextAfterBar(
                name: 'Chats',
                color: selectedTab == 'Chats' ? kPrimaryColor1 : kFontColor,
              ),
              if (selectedTab == 'Chats')
                Container(
                  height: 1.5, // Height of the line
                  color: kPrimaryColor1,
                  width: 53, // Width of the line
                ),
            ],
          ),
        ),
        const SizedBox(width: 100),
        GestureDetector(
          onTap: () => onTabSelected('Groups'), // Use the callback
          child: Column(
            children: [
              TextAfterBar(
                name: 'Groups',
                color: selectedTab == 'Groups' ? kPrimaryColor1 : kFontColor,
              ),
              if (selectedTab == 'Groups')
                Container(
                  height: 1.5, // Height of the line
                  color: kPrimaryColor1,
                  width: 53, // Width of the line
                ),
            ],
          ),
        ),
      ],
    );
  }
}
