import 'package:flutter/material.dart';
import 'package:nearme_app/core/constants.dart';

class NotificationItem extends StatelessWidget {
  final String? title;
  final String? name;
  final String message;
  final String time;
  final VoidCallback? onPressed;
  final bool showForwardIcon;
  const NotificationItem({
    Key? key,
    this.title,
    this.name,
    required this.message,
    required this.time,
    this.onPressed,
    this.showForwardIcon = true,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: 20),
      padding: EdgeInsets.all(5),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(10),
          topRight: Radius.circular(10),
          bottomRight: Radius.circular(10),
        ),
        color: notificationColor,
        boxShadow: [
          BoxShadow(
            color: Color.fromRGBO(0, 0, 0, 0.25),
            offset: Offset(0, 4),
            blurRadius: 4,
          ),
        ],
      ),
      child: Row(
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                if (title != null)
                  Text(
                    title!,
                    style: const TextStyle(
                      color: kPrimaryColor1,
                      fontFamily: 'OpenSans-Regular',
                      fontSize: 15,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                if (title != null) SizedBox(height: 10),
                Row(
                  children: [
                    if (name != null)
                      Text(
                        '$name:',
                        style: TextStyle(
                          color: textColor,
                          fontFamily: 'OpenSans-Regular',
                          fontSize: 15,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                    if (name != null) SizedBox(width: 10),
                    Expanded(
                      child: Text(
                        message,
                        style: TextStyle(
                          color: textColor,
                          fontFamily: 'OpenSans-Regular',
                          fontSize: 15,
                          fontWeight: FontWeight.w400,
                        ),
                        overflow: TextOverflow.ellipsis,
                        maxLines: 1,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
          Column(
            children: [
              if (showForwardIcon)
                IconButton(
                  icon: Icon(
                    Icons.arrow_forward_ios,
                    color: kPrimaryColor1,
                    size: 16,
                  ),
                  onPressed: onPressed,
                ),
              SizedBox(height: 5),
              Text(
                time,
                style: TextStyle(
                  color: textColor,
                  fontFamily: 'OpenSans-Regular',
                  fontSize: 9,
                  fontWeight: FontWeight.w400,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
