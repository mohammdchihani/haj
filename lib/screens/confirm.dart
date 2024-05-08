import 'package:commerce/inputs/textfiledsinginemailvalid.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import '../buttons/btn.dart';
import '../colors.dart';
import '../inputs/textfiledemail0singup.dart';
import '../inputs/textfiledemail1singup.dart';
import '../inputs/textfiledsingup0usernameval.dart';
import '../inputs/textfiledsingup1usernameval.dart';
import '../inputs/textfiledsinuppassword3.dart';
import '../textstyle.dart';
import '../views/ticket2.dart';
import '../views/ticket_view.dart';
import '../widgets/sub_title_widget.dart';

class confirm extends StatelessWidget {
  const confirm({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: MainColors.mainColor9,
        appBar: AppBar(
          backgroundColor: MainColors.mainColor1,
          elevation: 0,
          centerTitle: true,
          title: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'الحجز',
                style: TextStyle(
                  fontFamily: 'Tajawal',
                  color: MainColors.mainColor3,
                  fontWeight: FontWeight.bold,
                  fontSize: 22.0.sp,
                ),
              ),
              SizedBox(width: 8.w),
              Icon(
                Icons.airplane_ticket_outlined,
                color: Colors.white,
                size: 25.sp,
              ),
            ],
          ),
          iconTheme: IconThemeData(
            color: Colors.white,
          ),
        ),
        body: ListView(
          padding: EdgeInsets.symmetric(horizontal: 10.w),
          children: [
            SizedBox(height: 90.h),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [

                Text(
    " إدخال معلومات الحاج",
    style: Styles.textwelcomlogin,
    textAlign: TextAlign.center,
                ),
                SizedBox(height: 25.h),
                Customuser0Field(
                  textfield: "إدخال إسم الحاج",
                  text:" الإسم",
                ),
                SizedBox(height: 10.h),

                CustomEmailField3(
                  textfield:"  إدخال لقب الحاج",
                  text: "اللقب",
                ),
                SizedBox(height: 10.h),
                CustomEmailField0(
    textfield:" إدخال عمر الحاج",
    text: "العمر",
    ),

                SizedBox(height: 10.h),
                Customuser1Field(
                  textfield:" إدخال رقم الحاج ",
                  text:"الرقم",
                ),

                SizedBox(height: 22.h),
               btn(
                  text: 'تأكيد',
                  onPressed: () async {
                    _showLogoutConfirmation(context);
                    },
                ),

              ],
            ),

          ],
        ),
      ),
    );
  }
}


void _showLogoutConfirmation(BuildContext context) {
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return Directionality(
        textDirection: TextDirection.rtl, // Align the dialog to the right
        child: AlertDialog(
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              Icon(
                Icons.check_circle, // Choose your desired icon
                size: 50, // Adjust the size if needed
                color: Colors.green, // Adjust the color if needed
              ),
              SizedBox(height: 20), // Add some space between the icon and text
              Text(
                'الحجز قيد المراجعة',
                style: TextStyle(
                  fontSize: 17.sp,
                  fontFamily: 'Tajawal',
                  fontWeight: FontWeight.bold,
                  color: MainColors.mainColor1, // Adjust the color if needed
                ),
              ),
            ],
          ),
        ),
      );
    },
  );
}
