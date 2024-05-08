import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../colors.dart';
import '../textstyle.dart';

class textfiledwousoul extends StatefulWidget {
  final String? text;
  final TextEditingController? mycontroller;
  final String? Function(String?)? validator;

  textfiledwousoul({
    Key? key,
    this.text,
    this.mycontroller,
    this.validator,
  }) : super(key: key);

  @override
  _textfiledwousoulState createState() => _textfiledwousoulState();
}

class _textfiledwousoulState extends State<textfiledwousoul> {
  bool _hasError = false;
  DateTime? _selectedDate;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 25.0.w),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            if (widget.text != null)
              Align(
                alignment: Alignment.centerRight,
                child: Text(
                  widget.text!,
                  style: Styles.textnormal,
                ),
              ),
            SizedBox(height: 7.h),
            InkWell(
              onTap: () {
                _selectDate(context);
              },
              child: IgnorePointer(
                child: TextFormField(
                  textAlign: TextAlign.right,
                  style: Styles.tft,
                  controller: widget.mycontroller,
                  autovalidateMode: AutovalidateMode.disabled,
                  decoration: InputDecoration(
                    filled: true,
                    fillColor: MainColors.mainColor3,
                    contentPadding: EdgeInsets.symmetric(horizontal: 8.0.w),
                    errorStyle: TextStyle(
                      height: 1.0,
                    ),
                    errorMaxLines: 1,
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8.h),
                      borderSide: BorderSide(
                        color: MainColors.mainColor1,
                        width: 2.0.w,
                      ),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8.h),
                      borderSide: BorderSide(
                        color: MainColors.mainColor1,
                        width: 2.0.w,
                      ),
                    ),
                    hintText: widget.text ?? 'تاريخ الانطلاق',
                    suffixIcon: Icon(Icons.calendar_today),
                  ),
                  validator: widget.validator,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Future<void> _selectDate(BuildContext context) async {
    final DateTime? pickedDate = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(1900),
      lastDate: DateTime(2101),
    );
    if (pickedDate != null && pickedDate != _selectedDate) {
      setState(() {
        _selectedDate = pickedDate;
        widget.mycontroller!.text = _selectedDate!.toString(); // You can format the date as needed
      });
    }
  }
}
