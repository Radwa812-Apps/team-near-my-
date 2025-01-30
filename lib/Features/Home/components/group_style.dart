import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:nearme_app/core/constants.dart';

import 'round_image_widget.dart';

class GroupStyle extends StatelessWidget {
  final String? groupName;

  const GroupStyle({super.key, this.groupName});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: kPrimaryColor1.withOpacity(.20),
      ),
      width: 250,
      height: 80,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 8, right: 8),
            child: Row(
              children: [
                RoundImageWidget(
                    name: 'assets/images/group.jpg', width: 50, height: 50),
                const SizedBox(width: 20),
                Expanded(
                  child: Text(
                    groupName ?? '',
                    style: TextStyle(
                      fontSize: 20,
                      fontFamily: kFontRegular,
                      color: kFontColor,
                    ),
                    overflow:
                        TextOverflow.ellipsis, // Ensures text doesn't overflow
                  ),
                ),
                const SizedBox(width: 8),
                Icon(
                  Icons.notifications_outlined,
                  size: 30,
                  color: kPrimaryColor1,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
