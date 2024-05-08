import 'dart:ui';

import 'package:commerce/screens/adminopereating.dart';
import 'package:commerce/screens/bottom_bar.dart';
import 'package:commerce/singinadmin.dart';
import 'package:commerce/singup.dart';
import 'package:commerce/textstyle.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';

import '../APPBAR.dart';
import '../Crud.dart';
import '../Singin.dart';
import '../buttons/singupbutton.dart';
import '../colors.dart';
import '../endpoint.dart';
import '../textfiledediteadmin/textfiledgate.dart';
import '../textfiledediteadmin/textfiledmahatavol.dart';
import '../textfiledediteadmin/textfilednamevol.dart';
import '../textfiledediteadmin/textfileslocvol.dart';





class addadmin extends StatefulWidget {
  addadmin({Key? key}) : super(key: key);

  @override
  _addadminState createState() => _addadminState();
}

class _addadminState extends State<addadmin> {
  final Crud _crud = Crud();
  TextEditingController name = TextEditingController();
  TextEditingController city = TextEditingController();
  TextEditingController country = TextEditingController();
  TextEditingController gates = TextEditingController();

  @override
  void dispose() {
    name.dispose();
    city.dispose();
    country.dispose();
    gates.dispose();
    super.dispose();
  }
  bool isLoading = false;

  Future<void> addairport() async {
    setState(() {
      isLoading = true;
    });
    try {
      var response = await _crud.postRequest(APIEndpoints.adminaddair, {

        "name": name.text,
        "city": city.text,
        "country": country.text,
        "gates": gates.text,
      });
      print(response.toString());
      if (response != null) {
        print('home');
        Get.to(() =>  adminoperation());
      } else {
        print('airport failed');
      }
    } catch (e) {
      print('Error during airport: $e');
      // Show AwesomeDialog for the error

    } finally {
      setState(() {
        isLoading = false;
      });
    }
  }

  @override
  void initState() {
    super.initState();

  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        backgroundColor: MainColors.mainColor1, // Customize as needed
        elevation: 0, // Remove shadow
        centerTitle: true,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'إضافة رحلة ',
              style: TextStyle(
                fontFamily: 'Tajawal',
                color: MainColors.mainColor3,
                fontWeight: FontWeight.bold,
                fontSize: 22.0.sp,
              ),
            ),
            SizedBox(width: 8.w),
            Icon(
              Icons.airplanemode_on_rounded,
              color: Colors.white,
              size: 25.sp,
            ),
          ],
        ),
        iconTheme: IconThemeData(
          color: Colors.white, // Set icon color to white
        ),
      ),
      backgroundColor: LightColors.lightColor1,
      body: isLoading
          ? _buildLoadingWidget()
          : _buildContentWidget(),
    );
  }

  Widget _buildLoadingWidget() {
    return Center(
      child: Lottie.asset(
        "assets/animations/Animation - 1713222836422.json",
        height: 100.h,
        width: 100.w,
        repeat: true,
        animate: true,
      ),
    );
  }

  Widget _buildContentWidget() {
    return Padding(
      padding: EdgeInsets.fromLTRB(0, ScreenUtil().setHeight(5.r), 0, 0,),
      child:  Container(
        decoration: BoxDecoration(
          color: LightColors.lightColor1,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(30.h),
            topRight: Radius.circular(30.h),
          ),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SvgPicture.asset(
              'assets/images/Cream and Green Simple Minimalist Islamic Travel Agency Logo.svg', // Provide the correct path to your SVG file
              height: 140.0,
              width: 140.0,
            ),

            SizedBox(height: 10.h),
            Form(

              child: Column(
                children: [
                  textfilednamevol(
                    textfield: ":أدخل إسم المطار ",
                    text: "إسم المطار",
                    mycontroller: name,
                    validator: (val) {
                      if (val!.isEmpty) {
                        return "kcjccjjc";
                      }
                      return null;
                    },

                  ),
                  SizedBox(height: 10.h),
                  textfilelocvol(
                    textfield: ":أدخل  بلد المطار ",
                    text:"بلد المطار",
                mycontroller: country,
                  ),
                  SizedBox(height: 10.h),
                  textfiledmahatavol(
                    textfield: " :أدخل مدينة المطار",
                    text:"مدينة المطار",
                    mycontroller: city,
                  ),
                  SizedBox(height: 10.h),
                  textfiledgatevol(
                    textfield: ":أدخل  بوابات المطار",
                    text:" بوابات المطار",
                    mycontroller: gates,
                  ),
                ],
              ),
            ),
            SizedBox(height: 32.h),
            CustomButton(
              text: "تأكيد",
              onPressed: () async {
                addairport();
                Get.snackbar(
                  "تمت الاضافة بنجاح",
                  "تمت إضافة المطار إلى القائمة",
                  colorText: Colors.green,
                  duration: Duration(seconds: 2),
                  backgroundColor: Colors.white,
                  titleText: Align(
                    alignment: Alignment.centerRight,
                    child: Text(
                      "تمت الاضافة بنجاح",
                      style: TextStyle(
                        fontFamily: 'Tajawal',
                        color: MainColors.mainColor7,
                        fontWeight: FontWeight.bold,
                        fontSize: 18.0.sp,
                      ),
                    ),
                  ),
                  messageText: Align(
                    alignment: Alignment.centerRight,
                    child: Text(
                      "تمت إضافة المطار إلى القائمة",
                      style: TextStyle(
                        fontFamily: 'Tajawal',
                        color: MainColors.mainColor7,
                        fontWeight: FontWeight.bold,
                        fontSize: 14.0.sp,
                      ),
                    ),
                  ),
                  icon: Align(
                    alignment: Alignment.centerRight,
                    child: Icon(
                      Icons.check_circle,
                      color: Colors.green,
                      size: 35.r,
                    ),
                  ),
                  shouldIconPulse: true, // Adding pulse animation to the icon
                  barBlur: 20, // Adding blur effect to the snackbar
                  borderRadius: 10,
                  boxShadows: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.5), // Shadow color
                      spreadRadius: 3, // Spread radius
                      blurRadius: 5, // Blur radius
                      offset: Offset(0, 3), // Offset of the shadow
                    ),
                  ],
                  // Adjusting the border radius of the snackbar
                  margin: EdgeInsets.all(10), // Adjusting the margin of the snackbar
                );

              },
            ),
            SizedBox(height: 1.h),
          ],
        ),
      ),
    );
  }
}
