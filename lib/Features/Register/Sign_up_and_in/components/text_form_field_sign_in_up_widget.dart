import 'package:flutter/material.dart';

class TextFormFieldWidegt extends StatelessWidget {
  final String? name;
  final Icon? icon;
  final TextInputType? txt;

  const TextFormFieldWidegt({super.key, this.name, this.icon, this.txt});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(
        horizontal: 50.0,
      ),
      child: TextFormField(
        enabled: true,
        keyboardType: txt,
        style: TextStyle(
            color: Colors.white, // Set the input text color to white
            fontSize: 20,
            fontFamily: 'OpenSans-Regular'),
        decoration: InputDecoration(
          hintText: name,
          prefixIcon: icon,
          prefixIconConstraints: BoxConstraints(
            minWidth: 35,
          ),
          hintStyle: TextStyle(
            color: Colors.white,
            fontSize: 20,
            fontFamily: 'OpenSans_Condensed-Regular',
          ),
          focusedBorder: UnderlineInputBorder(
            borderSide: BorderSide(
              color: Colors.white,
              width: 1.5,
            ),
          ),
          enabledBorder: UnderlineInputBorder(
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
