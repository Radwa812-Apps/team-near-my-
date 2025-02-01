import 'package:flutter/material.dart';
import 'package:intl_phone_field/intl_phone_field.dart';
import 'package:intl_phone_field/phone_number.dart';

import '../../../../core/constants.dart';
import '../../../../core/services/validator.dart';

class PhoneNumberWidget extends StatelessWidget {
  PhoneNumberWidget({super.key, required this.onchange});
  final TextEditingController _phoneNumberController = TextEditingController();
  final Function(PhoneNumber) onchange;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: IntlPhoneField(
          controller: _phoneNumberController,
          validator: ((p0) {
            return Validator.validatePhoneNumber(p0);
          }),
          dropdownTextStyle: const TextStyle(color: Colors.white),
          keyboardType: TextInputType.phone,
          dropdownIcon: const Icon(
            Icons.arrow_drop_down,
            color: Colors.white, 
          ),
          style: const TextStyle(color: Colors.white),
          decoration: const InputDecoration(
            hintText: 'Phone Number',
            labelStyle: TextStyle(color: Colors.white),
            prefixIcon: Icon(
              Icons.phone_outlined,
              color: Colors.white,
            ),
            prefixIconConstraints: BoxConstraints(
              minWidth: 35,
            ),
            hintStyle: TextStyle(
              color: Colors.white,
              fontSize: 20,
              fontFamily: kFontRegular,
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
          initialCountryCode: 'IN',
          onSaved: (phone) {
            Validator.validatePhoneNumber(phone);
          },
          onChanged: onchange),
    );
  }
}
