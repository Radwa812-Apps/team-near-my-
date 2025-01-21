import 'package:flutter/material.dart';
import 'package:nearme_app/Features/Home/components/icon_button_widegt.dart';

import '../../../core/constants.dart';

class BottomContainerWithIcons extends StatelessWidget {
  double space = 35;

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
      child: Row(mainAxisAlignment: MainAxisAlignment.center, children: [
        IconButtonWidegt(
          onPressed: () {},
          icon: Icons.settings_outlined,
          size: 30,
        ),
        SizedBox(width: space),
        IconButtonWidegt(
          onPressed: () {},
          icon: Icons.notifications_outlined,
          size: 30,
        ),
        SizedBox(width: space),
        IconButtonWidegt(
          onPressed: () {},
          icon: Icons.person_outlined,
          size: 30,
        ),
        SizedBox(width: space),
        IconButtonWidegt(
          onPressed: () {},
          icon: Icons.home_outlined,
          size: 35,
        ),
      ]),
    );
  }
}
