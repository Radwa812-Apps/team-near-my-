import 'package:flutter/material.dart';


class PasswordLineUnder extends StatelessWidget {
  final double top;
  final double left;

  const PasswordLineUnder({
    super.key,
    required this.top,
    required this.left,
  });

  @override
  Widget build(BuildContext context) {
    return Positioned(
      top: top,
      left: left,
      child: Container(
        width: 310,
        height: 0.25,
        color: const Color.fromRGBO(61, 83, 0, 1),
      ),
    );
  }
}
