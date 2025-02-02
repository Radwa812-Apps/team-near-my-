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
    return GestureDetector(
      onTap: onPressed,
      child: Container(
        margin: const EdgeInsets.only(bottom: 20),
        padding: const EdgeInsets.all(5),
        decoration: const BoxDecoration(
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
                  if (title != null) const SizedBox(height: 10),
                  Row(
                    children: [
                      if (name != null)
                        Text(
                          '$name:',
                          style: const TextStyle(
                            color: textColor,
                            fontFamily: 'OpenSans-Regular',
                            fontSize: 15,
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                      if (name != null) const SizedBox(width: 10),
                      Expanded(
                        child: Text(
                          message,
                          style: const TextStyle(
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
                    icon: const Icon(
                      Icons.arrow_forward_ios,
                      color: kPrimaryColor1,
                      size: 16,
                    ),
                    onPressed: (() {}),
                  ),
                const SizedBox(height: 5),
                Text(
                  time,
                  style: const TextStyle(
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
      ),
    );
  }
}
