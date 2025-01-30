import 'package:flutter/material.dart';
import 'package:nearme_app/core/constants.dart';

class ForwardIcon extends StatelessWidget {
  final VoidCallback onPressed;

  const ForwardIcon({
    Key? key,
    required this.onPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return IconButton(
      icon: Icon(
        Icons.arrow_forward_ios,
        color: kPrimaryColor1, 
        size: 16,
      ),
      onPressed: onPressed,
    );
  }
}