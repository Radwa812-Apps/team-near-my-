import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:nearme_app/Features/Home/Home/components/draggable_sheet.dart';

import '../../../../core/constants.dart';

class ContainerTextFieldWidget extends StatefulWidget {
  final VoidCallback onTextFieldFocus;
  final DraggableScrollableController draggableScrollableController;
  final Function(String) onSubmitted;

  const ContainerTextFieldWidget({
    super.key,
    required this.onTextFieldFocus,
    required this.draggableScrollableController,
    required this.onSubmitted,
  });

  @override
  _ContainerTextFieldWidgetState createState() =>
      _ContainerTextFieldWidgetState();
}

class _ContainerTextFieldWidgetState extends State<ContainerTextFieldWidget> {
  final TextEditingController _textEditingController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    // return Container(
    //   color: Colors.black.withOpacity(0.5), // Dim background
    //   child: DraggableSheetWidget(
    //     draggableScrollableController: widget.draggableScrollableController,
    //     child: Padding(
    //       padding: const EdgeInsets.all(16.0),
    //       child: TextField(
    //         controller: _textEditingController,
    //         onTap: widget.onTextFieldFocus,
    //         style: const TextStyle(
    //           color: kFontColor,
    //           fontSize: 22,
    //           fontFamily: kFontItalic,
    //           fontStyle: FontStyle.italic,
    //         ),
    //         decoration: InputDecoration(
    //           hintText: 'Group Name',
    //           hintStyle: const TextStyle(
    //             color: kFontColor,
    //             fontSize: 22,
    //             fontFamily: kFontItalic,
    //             fontStyle: FontStyle.italic,
    //           ),
    //           contentPadding:
    //               const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
    //           suffixIcon: IconButton(
    //             icon: const Icon(
    //               Icons.check,
    //               color: kPrimaryColor1,
    //               size: 30,
    //             ),
    //             onPressed: () {
    //               final groupName = _textEditingController.text.trim();
    //               if (groupName.isNotEmpty) {
    //                 widget.onSubmitted(groupName);
    //                 _textEditingController.clear();
    //               }
    //             },
    //           ),
    //           border: OutlineInputBorder(
    //             borderRadius: BorderRadius.circular(30),
    //           ),
    //           enabledBorder: OutlineInputBorder(
    //             borderRadius: BorderRadius.circular(30),
    //             borderSide: const BorderSide(
    //               color: kPrimaryColor1,
    //             ),
    //           ),
    //         ),
    //       ),
    //     ),
    //   ),
    // );

    return Container(
      color: Colors.transparent, // تغيير لون الخلفية إلى الأبيض
      child: DraggableSheetWidget(
        draggableScrollableController: widget.draggableScrollableController,
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 14.h),
          child: Column(
            children: [
              // TextField مع أيقونة حذف
              Row(
                children: [
                  Expanded(
                      child: Container(
                    height: 50.h,
                    decoration: BoxDecoration(
                      color: Colors.white, // لون الخلفية أبيض
                      borderRadius: BorderRadius.circular(20), // حواف دائرية
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withOpacity(0.1), // لون الظل
                          blurRadius: 10, // قوة التموج
                          spreadRadius: 2, // انتشار الظل
                          offset: Offset(0, 4), // اتجاه الظل (أسفل)
                        ),
                      ],
                    ),
                    child: TextField(
                      controller: _textEditingController,
                      onTap: widget.onTextFieldFocus,
                      style: TextStyle(
                        color: kFontColor,
                        fontSize: 18.sp,
                        fontFamily: kFontItalic,
                        fontStyle: FontStyle.italic,
                      ),
                      decoration: InputDecoration(
                        suffixIcon: IconButton(
                          onPressed: () => _textEditingController
                              .clear(), // حذف محتوى TextField
                          icon: Icon(
                            Icons.close,
                            color: kFontColor,
                          ),
                        ),
                        hintText: 'Group Name',
                        hintStyle: TextStyle(
                          color: Colors.grey,
                          fontSize: 18.sp,
                          fontFamily: kFontItalic,
                          fontStyle: FontStyle.italic,
                        ),
                        contentPadding: EdgeInsets.symmetric(
                            horizontal: 20.w, vertical: 20.h),
                        border: InputBorder.none, // إزالة الحدود الداخلية
                        enabledBorder:
                            InputBorder.none, // إزالة الحدود عند التفعيل
                        focusedBorder:
                            InputBorder.none, // إزالة الحدود عند التركيز
                      ),
                    ),
                  )),
                ],
              ),
              SizedBox(height: 30.h), // مسافة بين العناصر
              // زر "Add" داخل حاوية صفراء
              Container(
                width: 90.w,
                height: 45.h,
                decoration: BoxDecoration(
                  color: kSpecialColor, // لون الخلفية أصفر
                  borderRadius: BorderRadius.circular(20), // حواف دائرية
                ),
                child: TextButton(
                  onPressed: () {
                    final groupName = _textEditingController.text.trim();
                    if (groupName.isNotEmpty) {
                      widget.onSubmitted(groupName); // تمرير القيمة
                      _textEditingController.clear(); // مسح الحقل
                    }
                  },
                  child: Text(
                    'Add',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 20.sp,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
