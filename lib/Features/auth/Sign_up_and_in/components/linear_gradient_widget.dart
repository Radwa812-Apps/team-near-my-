import 'package:flutter/material.dart';

class NearMeGradientColor extends StatelessWidget {
  @override
  Widget build(Object context) {
    return Container(
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [
            Color.fromRGBO(68, 110, 66, 1),
            Color.fromRGBO(177, 211, 209, 1),
          ],
          stops: [
            0.1, 
            1.0, 
          ],
        ),
      ),
    );
  }
}
