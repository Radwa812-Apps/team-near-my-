import 'package:flutter/material.dart';
import 'package:nearme_app/core/constants.dart';

class TextFormFieldWidget2 extends StatefulWidget {
  final String? hint;
  final Icon? prefixIcon;
  final TextInputType? keyboardType;
  final bool isPassword;

  const TextFormFieldWidget2({
    super.key,
    this.hint,
    this.prefixIcon,
    this.keyboardType,
    this.isPassword = false,
  });

  @override
  _TextFormFieldWidget2State createState() => _TextFormFieldWidget2State();
}

class _TextFormFieldWidget2State extends State<TextFormFieldWidget2> {
  bool _obscureText = true; // State to manage password visibility

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: 50.0,
      ),
      child: TextFormField(
        style: const TextStyle(
          color: Colors.white, // Set the input text color to white
          fontSize: 20,
          fontFamily: kFontRegular,
        ),
        keyboardType: widget.keyboardType,
        obscureText: widget.isPassword
            ? _obscureText
            : false, // Toggle visibility for passwords
        decoration: InputDecoration(
          hintText: widget.hint,
          prefixIcon: widget.prefixIcon,
          prefixIconConstraints: const BoxConstraints(
            minWidth: 35,
          ),
          suffixIcon: widget.isPassword
              ? IconButton(
                  icon: Icon(
                    _obscureText
                        ? Icons.visibility_off_outlined
                        : Icons.visibility_outlined,
                    color: Colors.white,
                  ),
                  onPressed: () {
                    setState(() {
                      _obscureText =
                          !_obscureText; // Toggle password visibility
                    });
                  },
                )
              : null, // Show suffix icon only for passwords
          hintStyle: const TextStyle(
            color: Colors.white,
            fontSize: 20,
            fontFamily: kFontRegular,
          ),
          focusedBorder: const UnderlineInputBorder(
            borderSide: BorderSide(
              color: Colors.white,
              width: 1.5,
            ),
          ),
          enabledBorder: const UnderlineInputBorder(
            borderSide: BorderSide(
              color: Colors.white,
              width: 1.5,
            ),
          ),
        ),
      ),
    );
  }
}
