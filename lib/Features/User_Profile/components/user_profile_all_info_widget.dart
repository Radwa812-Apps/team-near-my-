import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:nearme_app/Features/User_Profile/components/button_widget.dart';
import 'package:nearme_app/Features/User_Profile/components/edit_user_widget.dart';
import 'package:nearme_app/Features/User_Profile/screens/edit_screen.dart';
import '../../../../core/constants.dart';
import '../../Home/Home/components/round_image_widget.dart';
import 'user_profile_info_widget.dart';

class UserProfileAll_InfoWidget extends StatelessWidget {
  const UserProfileAll_InfoWidget({
    super.key,
    required this.firstName,
    required this.spaceWithRows,
    required this.lastName,
    required this.phoneNumber,
    required this.email,
    required this.birthDate,
    required this.imagePositionTop,
    required this.paddingTopContainer,
  });

  final String? firstName;
  final double spaceWithRows;
  final String? lastName;
  final String? phoneNumber;
  final String? email;
  final String? birthDate;
  final double? imagePositionTop;
  final double? paddingTopContainer;

  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;
    double screenWidth = MediaQuery.of(context).size.width;

    return Center(
      child: Stack(
        clipBehavior: Clip.none, // Allow the image to overflow
        children: [
          Padding(
            padding: EdgeInsets.only(top: paddingTopContainer!),
            child: Container(
              width: screenWidth * 0.85, // 80% of screen width
              height: screenHeight * 0.7,
              decoration: BoxDecoration(
                color: kPrimaryColor1.withOpacity(.20),
                borderRadius: BorderRadius.circular(20),
              ),
              child: Column(
                children: [
                  SizedBox(
                      height: screenWidth *
                          0.13), // Leave space for the image overflow
                  Text(
                    'Welcome $firstName',
                    style: const TextStyle(
                      color: kFontColor,
                      fontFamily: kFontBold,
                      fontSize: 30,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: screenWidth * 0.08),
                  UserProfileInfoWidget(
                    info: firstName,
                    iconData: Icons.person_outlined,
                    size: 25,
                  ),
                  SizedBox(height: spaceWithRows),

                  UserProfileInfoWidget(
                    info: lastName,
                    iconData: Icons.person_outlined,
                    size: 25,
                  ),
                  SizedBox(height: spaceWithRows),

                  UserProfileInfoWidget(
                    info: phoneNumber,
                    iconData: Icons.phone_outlined,
                    size: 25,
                  ),

                  SizedBox(height: spaceWithRows),
                  UserProfileInfoWidget(
                    info: email,
                    iconData: Icons.email_outlined,
                    size: 25,
                  ),

                  SizedBox(height: spaceWithRows),

                  UserProfileInfoWidget(
                    info: birthDate,
                    iconData: Icons.calendar_month_outlined,
                    size: 25,
                  ),
                  SizedBox(height: screenWidth * 0.1),
                  ButtonWidget(
                    name: 'Edit',
                    fontSize: 30,
                    onTap: () {
                      Navigator.pushNamed(context, EditScreen.editScreenKey);
                    },
                    size: Size(screenWidth * 0.7, screenHeight * .01),
                  ),
                ],
              ),
            ),
          ),
          Positioned(
            top: imagePositionTop, // Moves the image outside the container
            left: 120, // Centers the image horizontally within the container
            child: const RoundImageWidget(
              name: kDefaultUserImge,
              width: 110,
              height: 110,
            ),
          ),
        ],
      ),
    );
  }
}
