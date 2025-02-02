import 'package:flutter/material.dart';
import 'package:nearme_app/core/constants.dart';

import '../../Home/Home/components/round_image_widget.dart';

////
class RowCheckbox extends StatefulWidget {
  final String? userName;

  final Function(bool)? onChanged;

  const RowCheckbox({
    super.key,
    this.userName,
    this.onChanged,
  });

  @override
  _RowCheckboxState createState() => _RowCheckboxState();
}

class _RowCheckboxState extends State<RowCheckbox> {
  bool isChecked = false;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width, // Constrain the width
      child: Row(
        children: [
          const SizedBox(width: 20),
          const RoundImageWidget(
            name: kDefaultGroupImge,
            width: 50,
            height: 50,
          ),
          const SizedBox(width: 20),
          Text(
            widget.userName!,
            style: const TextStyle(
              color: kFontColor,
              fontSize: 20,
              fontFamily: kFontRegular,
            ),
          ),
          const Spacer(), // Add a spacer to push the checkbox to the end
          InkWell(
            onTap: () {
              setState(() {
                isChecked = !isChecked;
              });
              // Notify the parent about the checkbox state change
              if (widget.onChanged != null) {
                widget.onChanged!(isChecked);
              }
            },
            child: Container(
              width: 24,
              height: 24,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: isChecked ? kPrimaryColor1 : Colors.transparent,
                border: Border.all(
                  color: isChecked ? kPrimaryColor1 : Colors.grey,
                  width: 2,
                ),
              ),
              child: isChecked
                  ? const Icon(
                      Icons.check,
                      size: 16,
                      color: Colors.white,
                    )
                  : null,
            ),
          ),
          const SizedBox(width: 20), // Add some padding at the end
        ],
      ),
    );
  }
}
