import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../../core/constants.dart';

class UserProfileInfoWidget extends StatelessWidget {
  final String? info;
  final IconData? iconData;
  final double? size;
  const UserProfileInfoWidget({super.key, this.info, this.iconData, this.size});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.only(left: 30),
          child: Row(
            children: [
              Icon(
                iconData,
                color: kPrimaryColor1,
                size: size,
              ),
              SizedBox(width: 10),
              Text(info!,
                  style: TextStyle(
                    color: kFontColor,
                    fontFamily: kFontRegular,
                    fontSize: 20,
                  )),
            ],
          ),
        ),
        SizedBox(height: 5),
        Container(
          height: 1,
          color: kPrimaryColor1,
          width: 300,
        ),
      ],
    );
  }
}
