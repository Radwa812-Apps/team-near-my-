import 'package:flutter/material.dart';
import 'package:nearme_app/core/constants.dart';

class TextFormFieldWidget extends StatefulWidget {
  final String? hint;
  final Icon? prefixIcon;
  final TextInputType? keyboardType;
  final bool isPassword;
  final bool isBirthDate;
  final TextEditingController? controller; 
  final VoidCallback? onTap; 
  final String? Function(String?) validatior;
  final Function (String) onchange;

  const TextFormFieldWidget({
    super.key,
    this.hint,
    this.prefixIcon,
    this.keyboardType,
    this.isPassword = false,
    this.isBirthDate = false,
    this.controller,
    this.onTap, required this.validatior, required this.onchange,
    
  });

  @override
  _TextFormFieldWidgetState createState() => _TextFormFieldWidgetState();
}

class _TextFormFieldWidgetState extends State<TextFormFieldWidget> {
  bool _obscureText = true; 
  @override
 
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: 20.0,
      ),
      child: TextFormField(
       onChanged: widget.onchange,
        validator: widget.validatior,
        controller: widget.controller, 
        style: const TextStyle(
          color: Colors.white, 
          fontSize: 20,
          fontFamily: kFontRegular,
        ),
        keyboardType: widget.keyboardType,
        obscureText: widget.isPassword
            ? _obscureText
            : false, 
        readOnly: widget.isBirthDate, 
        onTap: widget.isBirthDate
            ? widget.onTap
            : null, 
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
                          !_obscureText; 
                    });
                  },
                )
              : null, 
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
