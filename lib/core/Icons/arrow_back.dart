import 'package:flutter/material.dart';

class ArrowBack extends StatelessWidget {
  const ArrowBack({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Positioned(
      top: 85,
      left: 40,
      child: GestureDetector(
        onTap: () {
          
          Navigator.pop(context);
        },
        child: const Icon(
          Icons.arrow_back_ios,
          
          color: Color.fromRGBO(61, 83, 0, 1),
        ),
      ),
    );
  }
}
