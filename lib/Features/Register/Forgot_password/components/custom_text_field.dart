import 'package:flutter/material.dart';

class CustomTextField extends StatelessWidget {
  final TextEditingController controller;
  final FocusNode currentFocus;
  final FocusNode? nextFocus;

  const CustomTextField({
    super.key,
    required this.controller,
    required this.currentFocus,
    this.nextFocus,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 30,
      child: TextField(
        controller: controller,
        focusNode: currentFocus,
        textAlign: TextAlign.center,
        style: const TextStyle(
          color: Color.fromRGBO(61, 83, 0, 1),
          fontFamily: 'Open Sans',
          fontSize: 24,
          fontWeight: FontWeight.normal,
        ),
        maxLength: 1, // Limit input to one character
        keyboardType: TextInputType.number, // Open numeric keyboard
        decoration: const InputDecoration(
          hintText: '0',
          hintStyle: TextStyle(
            color: Color.fromRGBO(61, 83, 0, 1),
            fontFamily: 'Open Sans',
            fontSize: 24,
            fontWeight: FontWeight.normal,
          ),
          counterText: '', // Hides the character count
          border: InputBorder.none,
          isDense: true,
          contentPadding: EdgeInsets.zero,
        ),
        onChanged: (value) {
          if (value.isNotEmpty && nextFocus != null) {
            nextFocus!.requestFocus(); // Move to the next field
          }
        },
      ),
    );
  }
}
