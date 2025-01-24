/*import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:nearme_app/core/constants.dart';

class GroupStyle extends StatelessWidget {
  final String? groupName;

  const GroupStyle({super.key, this.groupName});
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        color: kSpecialColor.withOpacity(.20),
      ),
      width: 250,
      height: 100,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 8),
            child: Row(
              children: [
                ClipOval(
                  child: Image.asset(
                    'assets/images/group.jpg',
                    width: 60,
                    height: 60,
                    fit: BoxFit
                        .cover, // Ensures the image covers the circular area
                  ),
                ),
                SizedBox(
                  width: 20,
                ),
                Text(
                  groupName!,
                  style: TextStyle(
                    fontSize: 20,
                    fontFamily: kFontRegular,
                    color: kFontColor,
                  ),
                ),
                const SizedBox(
                  width: 200,
                ),
                Icon(
                  Icons.notifications_outlined,
                  size: 30,
                  color: kPrimaryColor1,
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
*/
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:nearme_app/core/constants.dart';

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
                ClipOval(
                  child: Image.asset(
                    'assets/images/group.jpg',
                    width: 60,
                    height: 60,
                    fit: BoxFit
                        .cover, // Ensures the image covers the circular area
                  ),
                ),
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
