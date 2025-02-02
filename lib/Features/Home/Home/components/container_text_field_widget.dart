import 'package:flutter/material.dart';
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
    return Container(
      color: Colors.black.withOpacity(0.5), // Dim background
      child: DraggableSheetWidget(
        draggableScrollableController: widget.draggableScrollableController,
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: TextField(
            controller: _textEditingController,
            onTap: widget.onTextFieldFocus,
            style: const TextStyle(
              color: kFontColor,
              fontSize: 22,
              fontFamily: kFontItalic,
              fontStyle: FontStyle.italic,
            ),
            decoration: InputDecoration(
              hintText: 'Group Name',
              hintStyle: const TextStyle(
                color: kFontColor,
                fontSize: 22,
                fontFamily: kFontItalic,
                fontStyle: FontStyle.italic,
              ),
              contentPadding:
                  const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
              suffixIcon: IconButton(
                icon: const Icon(
                  Icons.check,
                  color: kPrimaryColor1,
                  size: 30,
                ),
                onPressed: () {
                  final groupName = _textEditingController.text.trim();
                  if (groupName.isNotEmpty) {
                    widget.onSubmitted(groupName); // Pass the value
                    _textEditingController.clear(); // Clear the field
                  }
                },
              ),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(30),
              ),
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(30),
                borderSide: const BorderSide(
                  color: kPrimaryColor1,
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
