import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:nearme_app/core/constants.dart';

import '../../../../core/data/models/userRadwa.dart';
import '../components/edit_user_widget.dart';

// ignore: must_be_immutable
class EditScreen extends StatelessWidget {
  static String editScreenKey = '/EditScreen';
  @override
  User user = User();

  EditScreen({super.key});

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double spaceWithRows = screenWidth * 0.05.w;

    return Scaffold(
      resizeToAvoidBottomInset: true,
      backgroundColor: kBackgroundColor,
      body: SingleChildScrollView(
        child: Stack(
          children: [
            Column(
              children: [
                SizedBox(height: 70.h),
                EditUserWidget(
                  spaceWithRows: spaceWithRows,
                  imagePositionTop: 15.h,
                  paddingTopContainer: 70.h,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
