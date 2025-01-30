import 'package:flutter/material.dart';
import 'package:nearme_app/Features/User%20Profile/components/edit_user_widget.dart';
import 'package:nearme_app/core/constants.dart';
import '../../../core/data/models/userRadwa.dart';

class EditScreen extends StatelessWidget {
  @override
  double spaceWithRows = 35;
  User user = User();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kBackgroundColor,
      body: Stack(
        children: [
          Column(
            children: [
              SizedBox(height: 70),
              EditUserWidget(
                spaceWithRows: spaceWithRows,
                imagePositionTop: 15,
                paddingTopContainer: 70,
              ),
            ],
          ),
        ],
      ),
    );
  }
}
