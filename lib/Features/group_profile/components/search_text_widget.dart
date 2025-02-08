import 'package:flutter/material.dart';
import '../../../core/constants.dart';

class SearchTextWidget extends StatelessWidget {
  const SearchTextWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20.0),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.1),
              blurRadius: 10,
              spreadRadius: 2,
              offset: const Offset(0, 4),
            ),
          ],
        ),
        child: TextField(
          decoration: InputDecoration(
            hintText: 'Search...',
            hintStyle: TextStyle(color: Colors.grey.withOpacity(0.8)),
            suffixIcon: const Icon(Icons.search, color: Colors.grey),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(20.0),
              borderSide: BorderSide(color: Colors.white.withOpacity(0.5)),
            ),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(20.0),
              borderSide: BorderSide(color: Colors.white.withOpacity(0.5)),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(20.0),
              borderSide: BorderSide(color: Colors.white.withOpacity(0.8)),
            ),
            filled: true,
            fillColor: Colors.white.withOpacity(0.9),
          ),
          style: const TextStyle(color: Colors.white),
          onChanged: (value) {},
        ),
      ),
    );

    //  Padding(
    //   padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 8),
    //   child: Container(
    //     decoration: BoxDecoration(
    //       color: Colors.white, // لون الخلفية أبيض
    //       borderRadius: BorderRadius.circular(30.0), // زوايا مستديرة
    //       boxShadow: [
    //         BoxShadow(
    //           color: Colors.black.withOpacity(0.1), // لون الظل
    //           blurRadius: 10.0, // درجة تموج الظل
    //           spreadRadius: 2.0, // انتشار الظل
    //           offset: Offset(0, 4), // اتجاه الظل (x, y)
    //         ),
    //       ],
    //     ),
    //     child: TextField(
    //       style: const TextStyle(
    //         fontFamily: kFontRegular,
    //         fontSize: 18,
    //         color: kFontColor,
    //       ),
    //       decoration: InputDecoration(
    //         contentPadding: const EdgeInsets.symmetric(
    //           horizontal: 20.0,
    //         ),
    //         hintText: 'Search...',
    //         hintStyle: TextStyle(
    //           color: Colors.grey[500], // لون نص التلميح
    //         ),
    //         suffixIcon: const Icon(
    //           Icons.search,
    //           color: kPrimaryColor1,
    //         ),
    //         fillColor: Colors.white, // لون الخلفية أبيض
    //         filled: true,
    //         focusedBorder: OutlineInputBorder(
    //           borderRadius: BorderRadius.circular(30.0),
    //           borderSide: const BorderSide(color: kPrimaryColor1, width: 1.0),
    //         ),
    //         enabledBorder: OutlineInputBorder(
    //           borderRadius: BorderRadius.circular(30.0),
    //           borderSide:
    //               const BorderSide(color: Colors.transparent, width: 1.0),
    //         ),
    //       ),
    //     ),
    //   ),
    // );
  }
}
