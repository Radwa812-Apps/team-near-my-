import 'package:flutter/material.dart';

import 'package:nearme_app/Features/Notifications/Components/date_label.dart';
import 'package:nearme_app/Features/Notifications/Components/header_notifications.dart';
import 'package:nearme_app/Features/Notifications/Components/notification_item.dart';
import 'package:nearme_app/Features/Notifications/Screens/group_notifications.dart';
import 'package:nearme_app/core/constants.dart';

class PersonalNotifications extends StatelessWidget {
  final String title;
  static const personalNotificationsKey = '/PersonalNotifications';

  const PersonalNotifications({
    Key? key,
    required this.title,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: background,
      body: SingleChildScrollView(
        child: Container(
          width: 393,
          height: 852,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(40),
            color: background,
          ),
          child: Column(
            children: [
              // Header
              HeaderNotifications(
                title: title,
                onBackPressed: () {
                  Navigator.pop(context);
                },
              ),
              // Date Label
              const DateLabel(dateText: 'Yesterday'),
              // Notifications List
              Expanded(
                child: ListView(
                  shrinkWrap: true,
                  padding: const EdgeInsets.symmetric(
                    horizontal: 20,
                  ),
                  children: [
                    NotificationItem(
                      message: 'Aliaa just arrived home',
                      time: '12:00 PM',
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const GroupNotifications(
                              title: 'Aliaa',
                            ),
                          ),
                        );
                      },
                      showForwardIcon: false,
                    ),
                    NotificationItem(
                      message: 'Aliaa on her way to work',
                      time: '12:00 PM',
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const GroupNotifications(
                              title: 'Aliaa',
                            ),
                          ),
                        );
                      },
                      showForwardIcon: false,
                    ),
                    NotificationItem(
                      message: 'Aliaa at the gym',
                      time: '12:00 PM',
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const GroupNotifications(
                              title: 'Aliaa',
                            ),
                          ),
                        );
                      },
                      showForwardIcon: false,
                    ),
                    NotificationItem(
                      message: 'Aliaa on her way to Home',
                      time: '12:00 PM',
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const GroupNotifications(
                              title: 'Aliaa',
                            ),
                          ),
                        );
                      },
                      showForwardIcon: false,
                    ),
                    NotificationItem(
                      message: 'Aliaa At El-Hamed Supermarket',
                      time: '12:00 PM',
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const PersonalNotifications(
                              title: 'Aliaa',
                            ),
                          ),
                        );
                      },
                      showForwardIcon: false,
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
