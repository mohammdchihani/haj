import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../colors.dart';
import '../textstyle.dart';


final formKey3email = GlobalKey<FormState>();

class CustomEmailField3 extends StatefulWidget {
  final String? text;
  final String? hintText;
  final TextEditingController? controller;
  final String? Function(String?)? validator;
  final TextEditingController? mycontroller;
  CustomEmailField3({
    Key? key,
    this.text,
    this.hintText,
    this.controller,
    this.mycontroller,
    this.validator, required String textfield,
  }) : super(key: key);

  @override
  _CustomEmailField3State createState() => _CustomEmailField3State();
}

class _CustomEmailField3State extends State<CustomEmailField3> {
  bool _hasError = false;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 25.0.w),
        child: Form(
          key: formKey3email,
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
                  hintText: widget.hintText ?? ' إدخال لقب الحاج',
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
