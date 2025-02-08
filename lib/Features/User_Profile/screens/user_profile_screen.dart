import 'package:flutter/material.dart';
import 'package:nearme_app/core/constants.dart';
import '../components/user_profile_all_info_widget.dart';

class UserProfileScreen extends StatefulWidget {
  static String userProfileScreenKey = '/UserProfileScreen';
  const UserProfileScreen({super.key});
  @override
  State<UserProfileScreen> createState() => _UserProfileScreenState();
}

class _UserProfileScreenState extends State<UserProfileScreen> {
  bool showThreeDotsWidget = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: kBackgroundColor,
        body: SingleChildScrollView(
          child: Column(
            children: const [
              SizedBox(height: 90),
              UserProfileAll_InfoWidget(
                spaceWithRows: 30,
                paddingTopContainer: 40,
                imagePositionTop: -20,
              ),
            ],
          ),
        ));
  }
}
