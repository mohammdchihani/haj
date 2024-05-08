import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../colors.dart';
import '../textstyle.dart';



class CustomButton2 extends StatelessWidget {
  final String text;
  final VoidCallback onPressed;
  final IconData? icon; // Added optional icon parameter

  CustomButton2({required this.text, required this.onPressed, this.icon});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: ScreenUtil().setWidth(25.0)),
      child: ElevatedButton(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
          padding: EdgeInsets.all(7.h),
          backgroundColor: MainColors.mainColor1,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12.h),
          ),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            if (icon != null)
              Padding(
                padding: EdgeInsets.only(right: 8.0), // Adjust spacing
                child: Icon(icon,color:Colors.white,),
              ),
            Container(
              height: 30.h,
              child: Center(
                child: Text(
                  text,
                  style: Styles.textbtnlogin.copyWith(fontSize: 17.sp),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

