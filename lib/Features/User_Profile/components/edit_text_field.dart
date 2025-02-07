import 'package:flutter/material.dart';
import 'package:nearme_app/core/constants.dart';

class EditTextField extends StatelessWidget {
  final String? hintText;
  final IconData? iconData;
  final bool? readOnly;
  final TextEditingController? controller;
  final TextInputType keyboardType;
  final Function(String)? onChanged;
  // final String Function(String?)? validate;

  const EditTextField({
    super.key,
    required this.hintText,
    required this.iconData,
    this.readOnly = false,
    this.controller,
    this.keyboardType = TextInputType.text, // Default to normal text input
    this.onChanged,
    //  required this.validate,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 28),
      child: TextFormField(
       // validator:validate ,
        controller: controller,
        readOnly: readOnly!,
        keyboardType: keyboardType,
        onChanged: onChanged,
        decoration: InputDecoration(
          hintText: hintText,
          border: InputBorder.none,
          prefixIcon: Padding(
            padding: const EdgeInsets.only(right: 12),
            child: Icon(
              iconData,
              color: kPrimaryColor1,
              size: 22,
            ),
          ),
          suffixIcon: const Icon(
            Icons.edit,
            color: kPrimaryColor1,
            size: 22,
          ),
          hintStyle: const TextStyle(
            fontSize: 20,
            fontFamily: kFontRegular,
            color: kFontColor,
          ),
          focusedBorder: const UnderlineInputBorder(
            borderSide: BorderSide(
              color: kPrimaryColor1,
              width: 1.5,
            ),
          ),
          enabledBorder: const UnderlineInputBorder(
            borderSide: BorderSide(
              color: kPrimaryColor1,
              width: 1.5,
            ),
          ),
        ),
        style: const TextStyle(
          fontSize: 20,
          fontFamily: kFontRegular,
          color: kFontColor,
        ),
      ),
    );
  }
}
