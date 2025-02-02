import 'package:flutter/material.dart';

import '../../../core/constants.dart';

class SearchTextWidget extends StatelessWidget {
  const SearchTextWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 8),
      child: TextField(
        style: const TextStyle(
          fontFamily: kFontRegular,
          fontSize: 18,
          color: kFontColor,
        ),
        decoration: InputDecoration(
            contentPadding: const EdgeInsets.symmetric(
              horizontal: 20.0,
            ),
            hintText: 'Search...',
            suffixIcon: const Icon(
              Icons.search,
              color: kPrimaryColor1,
            ),
            fillColor: Colors.grey[200],
            filled: true,
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(30.0),
              borderSide: const BorderSide(color: kPrimaryColor1, width: 1.0),
            ),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(30.0),
              borderSide: const BorderSide(color: kPrimaryColor1, width: 1.0),
            )),
      ),
    );
  }
}
