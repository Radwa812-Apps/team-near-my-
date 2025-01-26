import 'package:flutter/material.dart';

class GradientBackground extends StatelessWidget {
  const GradientBackground({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: double.infinity,
      decoration: const BoxDecoration(
        // gradient: LinearGradient(
        //   begin: Alignment.topLeft,
        //   end: Alignment.bottomRight,
        //   colors: [
        //     Color.fromRGBO(68, 110, 66, 1),
        //     Color.fromRGBO(177, 211, 209, 1),
        //   ],
        // ),
        gradient: LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: [
            Color.fromRGBO(34, 55, 33, 1),
            Color.fromRGBO(40, 66, 39, 1),
            Color.fromRGBO(47, 77, 46, 1),
            Color.fromRGBO(54, 88, 52, 1),
            Color.fromRGBO(61, 99, 59, 1),
            Color.fromRGBO(68, 110, 66, 1),
            Color.fromRGBO(86, 124, 84, 1),
            Color.fromRGBO(105, 139, 103, 1),
            Color.fromRGBO(124, 153, 122, 1),
            Color.fromRGBO(142, 168, 141, 1),
            Color.fromRGBO(161, 182, 160, 1),
          ],
          stops: [
            0.0, // First color at 0%
            0.1, // Second color at 10%
            0.2, // Third color at 20%
            0.3, // Fourth color at 30%
            0.4, // Fifth color at 40%
            0.5, // Sixth color at 50%
            0.6, // Seventh color at 60%
            0.7, // Eighth color at 70%
            0.8, // Ninth color at 80%
            0.9, // Tenth color at 90%
            1.0, // Last color at 100%
          ],
        ),
      ),
    );
  }
}
