import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../core/constants.dart';
import 'text_after_bar.dart';

class RowAfterBarChatsGroups extends StatelessWidget {
  final String selectedTab;
  final Function(String) onTabSelected;
  const RowAfterBarChatsGroups({
    super.key,
    required this.selectedTab,
    required this.onTabSelected,
  });

  @override
  Widget build(BuildContext context) {
    // return Row(
    //   mainAxisAlignment: MainAxisAlignment.center,
    //   children: [
    //     GestureDetector(
    //       onTap: () => onTabSelected('Chats'),
    //       child: Column(
    //         children: [
    //           TextAfterBar(
    //             name: 'Chats',
    //             color: selectedTab == 'Chats' ? kPrimaryColor1 : kFontColor,
    //           ),
    //           if (selectedTab == 'Chats')
    //             Container(
    //               height: 1.5.h, // Height of the line
    //               color: kPrimaryColor1,
    //               width: 53.w, // Width of the line
    //             ),
    //         ],
    //       ),
    //     ),
    //     SizedBox(width: 100.w),
    //     GestureDetector(
    //       onTap: () => onTabSelected('Groups'), // Use the callback
    //       child: Column(
    //         children: [
    //           TextAfterBar(
    //             name: 'Groups',
    //             color: selectedTab == 'Groups' ? kPrimaryColor1 : kFontColor,
    //           ),
    //           if (selectedTab == 'Groups')
    //             Container(
    //               height: 1.5.h, // Height of the line
    //               color: kPrimaryColor1,
    //               width: 53.w, // Width of the line
    //             ),
    //         ],
    //       ),
    //     ),
    //   ],
    // );
    return Padding(
      padding: const EdgeInsets.only(top: 20),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          GestureDetector(
            onTap: () => onTabSelected('Chats'),
            child: Container(
              padding: EdgeInsets.symmetric(vertical: 12.h, horizontal: 10.w),
              decoration: BoxDecoration(
                color: selectedTab == 'Chats'
                    ? kPrimaryColor1.withOpacity(0.2) // لون عند التحديد
                    : Colors.transparent, // شفاف عند عدم التحديد
                borderRadius: BorderRadius.circular(10.r), // حواف دائرية
              ),
              child: Text(
                'Chats',
                style: TextStyle(
                  color: selectedTab == 'Chats' ? kPrimaryColor1 : kFontColor,
                  fontSize: 16.sp,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
          SizedBox(width: 40.w), // المسافة بين العناصر
          GestureDetector(
            onTap: () => onTabSelected('Groups'),
            child: Container(
              padding: EdgeInsets.symmetric(vertical: 12.h, horizontal: 10.w),
              decoration: BoxDecoration(
                color: selectedTab == 'Groups'
                    ? kPrimaryColor1.withOpacity(0.2) // لون عند التحديد
                    : Colors.transparent, // شفاف عند عدم التحديد
                borderRadius: BorderRadius.circular(10.r), // حواف دائرية
              ),
              child: Text(
                'Groups',
                style: TextStyle(
                  color: selectedTab == 'Groups' ? kPrimaryColor1 : kFontColor,
                  fontSize: 16.sp,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
