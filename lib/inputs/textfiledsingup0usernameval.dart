import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../colors.dart';
import '../textstyle.dart';


final formKeyusername0 = GlobalKey<FormState>();

class Customuser0Field extends StatefulWidget {
  final String? text;
  final String? hintText;
  final TextEditingController? mycontroller;
  final String? Function(String?)? validator;

  Customuser0Field({
    Key? key,
    this.text,
    this.hintText,
    this.mycontroller,
    this.validator, required String textfield,
  }) : super(key: key);

  @override
  _Customuser0FieldState createState() => _Customuser0FieldState();
}

class _Customuser0FieldState extends State<Customuser0Field> {
  bool _hasError = false;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 25.0.w),
        child: Form(
          key:formKeyusername0,
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
                  hintText: widget.hintText ?? 'إدخال إسم الحاج',
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    setState(() {
                      _hasError = true;
                    });
                    return 'الرجاء إدخال إسم المستخدم';
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
