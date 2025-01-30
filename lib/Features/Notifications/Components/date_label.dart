import 'package:flutter/material.dart';
import 'package:nearme_app/core/constants.dart';

class DateLabel extends StatefulWidget {
  final String dateText;

  const DateLabel({
    Key? key,
    required this.dateText,
  }) : super(key: key);

  @override
  _DateLabelState createState() => _DateLabelState();
}

class _DateLabelState extends State<DateLabel> {
  late String _dateText;
  @override
  void initState() {
    super.initState();
    _dateText = widget.dateText;
  }

  Future<void> _openCalendar(BuildContext context) async {
    final DateTime? pickedDate = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2000),
      lastDate: DateTime(2101),
      builder: (BuildContext context, Widget? child) {
        return Theme(
          data: ThemeData.light().copyWith(
            colorScheme: ColorScheme.light(
              primary: kPrimaryColor1,
              onPrimary: Colors.white,
            ),
            dialogBackgroundColor: Colors.white,
          ),
          child: child!,
        );
      },
    );

    if (pickedDate != null) {
      setState(() {
        _dateText =
            "${pickedDate.year}-${pickedDate.month.toString().padLeft(2, '0')}-${pickedDate.day.toString().padLeft(2, '0')}";
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => _openCalendar(context),
      child: Padding(
        padding: const EdgeInsets.only(top: 10),
        child: Container(
          width: 45,
          height: 14,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(12),
            color: const Color.fromRGBO(61, 83, 0, 0.29),
          ),
          child: Center(
            child: Text(
              _dateText,
              style: TextStyle(
                color: textColor,
                fontFamily: 'Open Sans',
                fontSize: 8,
                fontWeight: FontWeight.normal,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
