import 'package:flutter/material.dart';

class TextFormPasswordFieldWidget extends StatefulWidget {
  final String? name;
  final Icon? icon;
  final Icon? suffx;

  const TextFormPasswordFieldWidget({
    super.key,
    this.name,
    this.icon,
    this.suffx,
  });

  @override
  _TextFormPasswordFieldWidgetState createState() =>
      _TextFormPasswordFieldWidgetState();
}

class _TextFormPasswordFieldWidgetState
    extends State<TextFormPasswordFieldWidget> {
  bool _obscureText = true; // State to manage password visibility

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: 50.0,
      ),
      child: TextFormField(
        style: TextStyle(
          color: Colors.white, // Set the input text color to white
          fontSize: 20,
          fontFamily: 'OpenSans-Regular',
        ),
        obscureText: _obscureText, // Use the state to toggle visibility
        decoration: InputDecoration(
          hintText: widget.name,
          prefixIcon: widget.icon,
          prefixIconConstraints: BoxConstraints(
            minWidth: 35,
          ), // Use the prefix icon passed as a parameter
          suffixIcon: IconButton(
            icon: _obscureText
                ? widget.suffx ??
                    Icon(Icons.visibility_off_outlined, color: Colors.white)
                : Icon(Icons.visibility_outlined, color: Colors.white),
            onPressed: () {
              setState(() {
                _obscureText = !_obscureText; // Toggle the state
              });
            },
          ),
          hintStyle: TextStyle(
            color: Colors.white,
            fontSize: 20,
            fontFamily: 'OpenSans_Condensed-Regular',
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
