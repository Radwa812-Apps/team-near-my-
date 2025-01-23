import 'package:flutter/material.dart';
import 'package:nearme_app/core/constants.dart';

class MakeGroupWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 302,
      height: 58,
      decoration: BoxDecoration(
        color: Color(0xFFDCE2CC),
        borderRadius: BorderRadius.circular(40),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.3),
            spreadRadius: 2,
            blurRadius: 5,
            offset: Offset(0, 3), // Shadow position
          ),
        ],
      ),
      child: Padding(
        padding: const EdgeInsets.only(top: 8),
        child: TextField(
          style: const TextStyle(
            color: kFontColor, // Set the input text color to white
            fontSize: 18,
            fontFamily: kFontRegular,
          ),
          decoration: InputDecoration(
            hintText: 'Group Name',
            hintStyle: TextStyle(
              color: kFontColor,
              fontFamily: kFontRegular,
            ),
            border: InputBorder.none,
            contentPadding: EdgeInsets.symmetric(vertical: 12, horizontal: 20),
            suffixIcon: Padding(
              padding: const EdgeInsets.only(right: 12),
              child: IconButton(
                icon: Icon(
                  Icons.check,
                  color: kPrimaryColor1,
                ),
                onPressed: () {
                  // Add the functionality here
                },
              ),
            ),
          ),
        ),
      ),
    );
  }
}
