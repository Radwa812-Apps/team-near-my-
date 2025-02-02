import 'package:flutter/material.dart';
import 'package:nearme_app/Features/Settings/components/confirm_message_widget.dart';
import 'package:nearme_app/core/constants.dart';

/*class LeaveGroup extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;
    return Container(
      height: screenHeight * .1,
      width: screenWidth * .6,
      decoration: BoxDecoration(
        color: kBackgroundColor,
        borderRadius: BorderRadius.circular(10),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.1),
            spreadRadius: 1,
            blurRadius: 5,
            offset: Offset(0, 3), // Shadow position
          ),
        ],
      ),
      child: Padding(
        padding: const EdgeInsets.only(left: 10),
        child: GestureDetector(
          onTap: () {
            ConfirmMessageWidget(
              message: 'Are you sure you want to leave the group?',
              onCancel: () {},
              onConfirm: () {},
            );
          },
          child: Row(
            children: [
              Icon(
                Icons.exit_to_app,
                color: kFontColor,
                size: 30,
              ),
              SizedBox(width: 10),
              Text(
                'Leave Group',
                style: TextStyle(
                  color: kFontColor,
                  fontFamily: kFontRegular,
                  fontWeight: FontWeight.normal,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
*/
import 'package:flutter/material.dart';
import 'package:nearme_app/core/constants.dart';

class LeaveGroup extends StatelessWidget {
  final VoidCallback onLeaveGroupPressed;

  LeaveGroup({required this.onLeaveGroupPressed});

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;
    return Container(
      height: screenHeight * .1,
      width: screenWidth * .6,
      decoration: BoxDecoration(
        color: kBackgroundColor,
        borderRadius: BorderRadius.circular(10),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.1),
            spreadRadius: 1,
            blurRadius: 5,
            offset: Offset(0, 3), // Shadow position
          ),
        ],
      ),
      child: Padding(
        padding: const EdgeInsets.only(left: 10),
        child: GestureDetector(
          onTap: onLeaveGroupPressed, // Use the callback here
          child: Row(
            children: [
              Icon(
                Icons.exit_to_app,
                color: kFontColor,
                size: 30,
              ),
              SizedBox(width: 10),
              Text(
                'Leave Group',
                style: TextStyle(
                  color: kFontColor,
                  fontFamily: kFontRegular,
                  fontWeight: FontWeight.normal,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
