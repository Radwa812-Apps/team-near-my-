import 'package:flutter/material.dart';
import 'package:intl_phone_field/intl_phone_field.dart';
import 'package:intl_phone_field/phone_number.dart';

import '../../../../core/constants.dart';
import '../../../../core/services/validator.dart';

class PhoneNumberWidget extends StatelessWidget {
  PhoneNumberWidget(
      {super.key,
      required this.onchange,
      required this.dropdownTextStyleColor,
      required this.dropdownIconColor,
      required this.hintStyleColor,
      required this.focusedBorderColor,
      required this.enabledBorderColor, required this.hint, required this.phoneNumberController});
  final TextEditingController phoneNumberController;
  final Function(PhoneNumber) onchange;
  final Color dropdownTextStyleColor;
  final Color dropdownIconColor;
  final Color hintStyleColor;
  final Color focusedBorderColor;
  final Color enabledBorderColor;

  final String hint;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: IntlPhoneField(
          controller: phoneNumberController,
          validator: ((p0) {
            return Validator.validatePhoneNumber(p0);
          }),
          dropdownTextStyle: TextStyle(color: dropdownTextStyleColor),
          keyboardType: TextInputType.phone,
          dropdownIcon: Icon(
            Icons.arrow_drop_down,
            color: dropdownIconColor,
          ),
          style: const TextStyle(color: kFontColor),
          decoration: InputDecoration(
            hintText: hint,
            labelStyle: const TextStyle(color: Colors.white),
            prefixIcon: const Icon(
              Icons.phone_outlined,
              color: Colors.white,
            ),
            prefixIconConstraints: const BoxConstraints(
              minWidth: 35,
            ),
            hintStyle: TextStyle(
              color: hintStyleColor,
              fontSize: 20,
              fontFamily: kFontRegular,
            ),
            focusedBorder: UnderlineInputBorder(
              borderSide: BorderSide(
                color: focusedBorderColor,
                width: 1.5,
              ),
            ),
            enabledBorder: UnderlineInputBorder(
              borderSide: BorderSide(
                color: enabledBorderColor,
                width: 1.5,
              ),
            ),
          ),
          initialCountryCode: 'IN',
          onSaved: (phone) {
            Validator.validatePhoneNumber(phone);
          },
          onChanged: onchange),
    );
  }
}
