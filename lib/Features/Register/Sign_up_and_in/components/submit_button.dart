import 'package:flutter/material.dart';

import '../../../../core/constants.dart';

class SubmitButton extends StatelessWidget {
  final String? name;
  final void Function()? onTap;

  const SubmitButton({super.key, this.name, this.onTap});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 50.0),
      child: InkWell(
        onTap: onTap,
        borderRadius:
            BorderRadius.circular(30), // Match the container's border radius
        child: Container(
          height: 51,
          width: 200,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(30),
            color: kSpecialColor,
          ),
          child: Center(
            child: Text(
              name!,
              style: const TextStyle(
                color: Colors.white,
                fontSize: 29,
                fontFamily: 'OpenSans-SemiBold',
              ),
            ),
          ),
        ),
      ),
    );
  }
}
