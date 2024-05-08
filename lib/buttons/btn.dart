import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../colors.dart';



class btn extends StatelessWidget {
  final String text;
  final VoidCallback onPressed;
  final IconData? icon; // Added optional icon parameter

  btn({required this.text, required this.onPressed, this.icon});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: ScreenUtil().setWidth(35.0)),
      child: ElevatedButton(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
          padding: EdgeInsets.all(8.h),
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
              height: 25.h,

              child: Center(
                child: Text(
                  text,
                  style: TextStyle(
                    fontFamily: 'Tajawal',
                    color: MainColors.mainColor3,
                    fontWeight: FontWeight.bold,
                    fontSize: 20.0.sp,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
