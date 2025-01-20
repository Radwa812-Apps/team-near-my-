import 'package:flutter/material.dart';

class BoldTextWidget extends StatelessWidget {
  final String? name;

  const BoldTextWidget({super.key, this.name});
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(
        top: 50.0,
      ),
      child: Text(name!,
          style: TextStyle(
            fontSize: 40,
            color: Colors.white,
            fontFamily: 'OpenSans-Bold',
            fontWeight: FontWeight.bold,
          )),
    );
  }
}
