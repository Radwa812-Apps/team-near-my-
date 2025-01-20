import 'package:flutter/material.dart';

class CircleIndicator extends StatelessWidget {
  const CircleIndicator({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 46,
      height: 43,
      decoration: const BoxDecoration(
        color: Color.fromRGBO(171, 186, 124, 1),
        borderRadius: BorderRadius.all(
          Radius.elliptical(46, 43),
        ),
      ),
    );
  }
}
