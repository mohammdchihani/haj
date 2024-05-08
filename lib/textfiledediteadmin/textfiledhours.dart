import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../colors.dart';
import '../textstyle.dart';




class textfiledhours extends StatefulWidget {
  final String? text;
  final String? hintText;
  final TextEditingController? mycontroller;
  final String? Function(String?)? validator;

  textfiledhours({
    Key? key,
    this.text,
    this.hintText,
    this.mycontroller,
    this.validator, required String textfield,
  }) : super(key: key);

  @override
  _textfiledhoursState createState() => _textfiledhoursState();
}

class _textfiledhoursState extends State<textfiledhours> {
  bool _hasError = false;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 25.0.w),
        child: Form(
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
              TextFormField(
                textAlign: TextAlign.right,
                style: Styles.tft,
                controller: widget.mycontroller,
                autovalidateMode: AutovalidateMode.disabled,
                onTap: () {
                  setState(() {
                    _hasError = false;
                  });
                },
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
                  hintText: widget.hintText ?? 'ساعات الرحلة',
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    setState(() {
                      _hasError = true;
                    });
                    return 'الرجاء إدخال عنوان بريد إلكتروني';
                  }
                  if (!RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$').hasMatch(value)) {
                    setState(() {
                      _hasError = true;
                    });
                    return 'الرجاء إدخال عنوان بريد إلكتروني صالح';
                  }
                  setState(() {
                    _hasError = false;
                  });
                  return null;
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
