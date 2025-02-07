import 'package:flutter/material.dart';
import 'package:nearme_app/core/constants.dart';

import '../../../../core/data/models/userRadwa.dart';
import '../components/edit_user_widget.dart';

class EditScreen extends StatelessWidget {
  static String editScreenKey = '/EditScreen';
  @override
  User user = User();

  @override
  Widget build(BuildContext context) {
    // double screenHeight = MediaQuery.of(context).size.height;
    double screenWidth = MediaQuery.of(context).size.width;

    double spaceWithRows = screenWidth * 0.05;
    return Scaffold(
      resizeToAvoidBottomInset: true,
      backgroundColor: kBackgroundColor,
      body: SingleChildScrollView(
        child: Stack(
          children: [
            Column(
              children: [
                const SizedBox(height: 70),
                EditUserWidget(
                  spaceWithRows: spaceWithRows,
                  imagePositionTop: 15,
                  paddingTopContainer: 70,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
