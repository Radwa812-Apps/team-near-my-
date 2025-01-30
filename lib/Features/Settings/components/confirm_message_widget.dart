import 'package:flutter/material.dart';
import 'package:nearme_app/core/constants.dart';

import 'button_widget.dart';

class ConfirmMessageWidget extends StatelessWidget {
  final String message;
  final VoidCallback onCancel;
  final VoidCallback onConfirm;

  ConfirmMessageWidget({
    required this.message,
    required this.onCancel,
    required this.onConfirm,
  });

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      backgroundColor: kBackgroundColor,
      title: Text(
        'Confirm',
        style: TextStyle(
          color: kFontColor,
          fontFamily: kFontBold,
          fontWeight: FontWeight.bold,
        ),
      ),
      elevation: 10.0, 
      
      // shadowColor: Colors.black54, 
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16.0), 
        side: BorderSide(
            color: Colors.grey.shade300, width: 1), 
      ),

      content: Text(message,
          style: TextStyle(
            color: kFontColor,
            fontFamily: kFontRegular,
            fontStyle: FontStyle.normal,
          )),
      actions: <Widget>[
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Button(
              onTap: onCancel,
              nameOfButton: 'Cancel',
              backgroundColor: kSpecialColor,
            ),
            SizedBox(
              width: 50,
            ),
            Button(
              onTap: onConfirm,
              nameOfButton: 'Confirm',
              backgroundColor: Colors.red,
            ),
          ],
        ),

        // Confirm Button
      ],
    );
  }
}
