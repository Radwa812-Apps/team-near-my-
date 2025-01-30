import 'package:flutter/material.dart';

import 'package:nearme_app/Features/Notifications/Components/date_label.dart';
import 'package:nearme_app/Features/Notifications/Components/header_notifications.dart';
import 'package:nearme_app/Features/Notifications/Components/notification_item.dart';
import 'package:nearme_app/core/constants.dart';

class GroupNotifications extends StatelessWidget {
  final String title;
    static const groupNotificationsKey = 'GroupNotifications';


  const GroupNotifications({
    Key? key,
    required this.title,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: background,
      body: SingleChildScrollView(
        child: Container(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(40),
            color: background,
          ),
          child: Column(
            children: [
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
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: ListView(
                    shrinkWrap: true,
                    children: [
                      NotificationItem(
                        name: 'Aliaa',
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
                        showForwardIcon: true,
                      ),
                      NotificationItem(
                        name: 'Radwa',
                        message: 'Radwa just arrived home',
                        time: '12:00 PM',
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => const GroupNotifications(
                                title: 'Radwa',
                              ),
                            ),
                          );
                        },
                        showForwardIcon: true,
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
