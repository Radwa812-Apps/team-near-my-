import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:nearme_app/core/constants.dart';

class PersonalNotificationItem extends StatelessWidget {
  final String message;
  final String time;
  final VoidCallback? onPressed;
  final bool showForwardIcon;
  const PersonalNotificationItem({
    Key? key,
    required this.message,
    required this.time,
    this.onPressed,
    this.showForwardIcon = true,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      // استخدام SizedBox لتحديد حجم ثابت
      width: 300.w, // تحديد عرض ثابت
      height: 86.h,
      child: Container(
        margin: EdgeInsets.only(bottom: 10.h),
        padding: EdgeInsets.symmetric(horizontal: 5.w, vertical: 8.h),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(20.w), // الزاوية العلوية اليسرى
            topRight: Radius.circular(20.w), // الزاوية العلوية اليمنى
            bottomLeft: Radius.circular(10.w), // الزاوية السفلية اليسرى
            bottomRight: Radius.circular(10.w), // الزاوية السفلية اليمنى
          ),
          color: Color.fromRGBO(181, 158, 90, 0.675).withOpacity(0.5),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.2), // لون الظل
              blurRadius: 10.0, // درجة تموج الظل
              spreadRadius: 2.0, // انتشار الظل
              offset: Offset(0, 4), // اتجاه الظل (x, y)
            ),
          ],
          border: Border.all(
            color: Colors.white.withOpacity(0.5), // لون الحدود
            width: 1.0, // سمك الحدود
          ),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Flexible(
              // استبدال Expanded بـ Flexible
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Row(
                    children: [
                      Flexible(
                        // استبدال Expanded بـ Flexible
                        child: Text(
                          message,
                          style: TextStyle(
                            color: Colors.white.withOpacity(0.8),
                            fontFamily: 'OpenSans-Regular',
                            fontSize: 15.sp,
                            fontWeight: FontWeight.w400,
                          ),
                          overflow: TextOverflow.ellipsis,
                          maxLines: 1,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                if (showForwardIcon)
                  IconButton(
                    icon: const Icon(
                      Icons.arrow_forward_ios,
                      color: kPrimaryColor1,
                      size: 16,
                    ),
                    onPressed: () {},
                  ),
                SizedBox(height: 5.h),
                Text(
                  time,
                  style: TextStyle(
                    color: textColor,
                    fontFamily: 'OpenSans-Regular',
                    fontSize: 9.sp,
                    fontWeight: FontWeight.w400,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
