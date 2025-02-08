import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

import '../../../core/constants.dart';
import '../../Home/Home/components/round_image_widget.dart';

class MemberGroupInside extends StatelessWidget {
  const MemberGroupInside({
    super.key,
    required this.userName,
    required this.lastLocatin,
    required this.distance,
  });

  final String userName;
  final String lastLocatin;
  final String distance;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 80,
      width: double.infinity, // Make the container take full width
      decoration: BoxDecoration(
        border: Border.all(
          color: kPrimaryColor1, // Border color
          width: 1, // Border width
        ),
        borderRadius: BorderRadius.circular(30), // Rounded corners
        boxShadow: const [
          BoxShadow(
            color: kBackgroundColor, // Shadow color
            blurRadius: 10, // Shadow blur
            spreadRadius: 2, // Shadow spread
            offset: Offset(0, 0), // Shadow position
          ),
        ],
      ),
      child: Row(
        crossAxisAlignment:
            CrossAxisAlignment.center, // Align items vertically in the center
        children: [
          const Padding(
            padding: EdgeInsets.only(left: 16),
            child: RoundImageWidget(
              name: kDefaultUserImge,
              width: 50,
              height: 50,
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 16),
            child: Column(
              mainAxisAlignment: MainAxisAlignment
                  .center, // Align text vertically in the center
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  userName,
                  style: const TextStyle(
                    color: kFontColor,
                    fontSize: 20,
                    fontFamily: kFontRegular,
                  ),
                ),
                const SizedBox(
                  height: 1,
                ),
                Text(
                  lastLocatin,
                  style: const TextStyle(
                    color: Colors.grey,
                    fontSize: 15,
                    fontFamily: kFontRegular,
                  ),
                ),
              ],
            ),
          ),
          const Spacer(), // Add space between the text and the distance
          Padding(
            padding: const EdgeInsets.only(right: 16),
            child: Text(
              distance,
              style: const TextStyle(
                color: Colors.grey,
                fontSize: 15,
                fontFamily: kFontRegular,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
