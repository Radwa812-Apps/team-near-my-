import 'package:flutter/material.dart';

import '../../../../core/constants.dart';


class FloatingYellowIcon extends StatelessWidget {
  final Function()? toggleDraggableSheet;

  const FloatingYellowIcon({super.key, this.toggleDraggableSheet});

  @override
  Widget build(BuildContext context) {
    return Positioned(
      bottom: 40, // Adjust the position as needed
      right: 20, // Adjust the position as needed
      child: Container(
        width: 60,
        height: 60,
        decoration: BoxDecoration(
          color: kSpecialColor, // Yellow color
          borderRadius: BorderRadius.circular(30), // Circular shape
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.3),
              spreadRadius: 2,
              blurRadius: 5,
              offset: const Offset(0, 3), // Shadow position
            ),
          ],
        ),
        child: IconButton(
          icon: const Icon(
            Icons.add,
            color: Colors.white,
            size: 30,
          ),
          onPressed: toggleDraggableSheet, // Show the sheet
        ),
      ),
    );
  }
}
