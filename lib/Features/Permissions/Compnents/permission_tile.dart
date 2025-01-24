import 'package:flutter/material.dart';
import 'package:nearme_app/core/constants.dart';

class PermissionTile extends StatelessWidget {
  final IconData icon;
  final String title;
  final String subtitle;
  final bool switchValue; 
  final Function(bool) onChanged; 

  const PermissionTile({
    Key? key,
    required this.icon,
    required this.title,
    required this.subtitle,
    required this.switchValue,
    required this.onChanged, 
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 22.0),
      child: Row(
        children: [
          Icon(
            icon,
            size: 30.0,
            color: kPrimaryColor1,
          ),
          const SizedBox(width: 16),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: const TextStyle(
                      fontSize: 18.0,
                      fontFamily: 'OpenSans-Regular',
                      fontWeight: FontWeight.w400,
                      color: textColor),
                ),
                Text(
                  subtitle,
                  style: const TextStyle(
                      fontSize: 13.0,
                      color: gray,
                      fontFamily: 'OpenSans-Italic',
                      fontStyle: FontStyle.italic,
                      ),
                ),
              ],
            ),
          ),
          Transform.scale(
            scale: 0.8, 
            child: Switch(
              value: switchValue, 
              onChanged: onChanged, 
              activeColor: kPrimaryColor1,
            ),
          ),
        ],
      ),
    );
  }
}
