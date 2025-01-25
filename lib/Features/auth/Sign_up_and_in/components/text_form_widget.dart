import 'package:flutter/material.dart';
import 'package:nearme_app/core/constants.dart';

class TextFormFieldWidget extends StatefulWidget {
  final String? hint;
  final Icon? prefixIcon;
  final TextInputType? keyboardType;
  final bool isPassword;
  final bool isBirthDate;
  final TextEditingController? controller; // Add controller parameter
  final VoidCallback? onTap; // Add onTap callback

  const TextFormFieldWidget({
    super.key,
    this.hint,
    this.prefixIcon,
    this.keyboardType,
    this.isPassword = false,
    this.isBirthDate = false,
    this.controller,
    this.onTap,
  });

  @override
  _TextFormFieldWidgetState createState() => _TextFormFieldWidgetState();
}

class _TextFormFieldWidgetState extends State<TextFormFieldWidget> {
  bool _obscureText = true; // State to manage password visibility

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: 50.0,
      ),
      child: TextFormField(
        validator: (value) {
          if (value!.isEmpty) {
            return 'Please Fill This Field';
          }
          return null;
        },
        controller: widget.controller, // Use the provided controller
        style: const TextStyle(
          color: Colors.white, // Set the input text color to white
          fontSize: 20,
          fontFamily: kFontLight,
        ),
        keyboardType: widget.keyboardType,
        obscureText: widget.isPassword
            ? _obscureText
            : false, // Toggle visibility for passwords
        readOnly: widget.isBirthDate, // Make the field read-only for birthdate
        onTap: widget.isBirthDate
            ? widget.onTap
            : null, // Use the onTap callback for birthdate
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
