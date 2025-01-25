import 'package:flutter/material.dart';

class NearMeGradientColor extends StatelessWidget {
  @override
  Widget build(Object context) {
    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [
            Color.fromRGBO(68, 110, 66, 1),
            Color.fromRGBO(177, 211, 209, 1),
          ],
          stops: [
            0.1, // 70% of the gradient is the darker color
            1.0, // Remaining 30% is the lighter color
          ],
        ),
      ),
    );
  }
}
