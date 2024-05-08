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
import '../textfiledediteadmin/textfiledhours.dart';
import '../textfiledediteadmin/textfiledmahatavol.dart';
import '../textfiledediteadmin/textfilednamemahata.dart';
import '../textfiledediteadmin/textfilednamevol.dart';
import '../textfiledediteadmin/textfiledprice.dart';
import '../textfiledediteadmin/textfiledstart.dart';
import '../textfiledediteadmin/textfiledwousoul.dart';
import '../textfiledediteadmin/textfileslocvol.dart';
import 'addadmin.dart';
import 'adminaddticket.dart';





class addticket extends StatefulWidget {
  final int? airportId;
  addticket( {Key? key, this.airportId}) : super(key: key);

  @override
  _addticketState createState() => _addticketState();
}

class _addticketState extends State<addticket> {
  final Crud _crud = Crud();
  TextEditingController to = TextEditingController();
  TextEditingController price = TextEditingController();
  TextEditingController timeOfFlight = TextEditingController();
  TextEditingController endTime = TextEditingController();
  TextEditingController startTime = TextEditingController();

  @override
  void dispose() {
    to.dispose();
    price.dispose();
    timeOfFlight.dispose();
    endTime.dispose();
    startTime.dispose();
    super.dispose();
  }
  bool isLoading = false;

  Future<void> addairport() async {
    print(widget.airportId);
    setState(() {
      isLoading = true;
    });
    try {
      var response = await _crud.postRequest(APIEndpoints.flight, {
        "airportId": widget.airportId,
        "to": to.text,
        "price": price.text,
        "timeOfFlight": timeOfFlight.text,
        "endTime": endTime.text,
        "startTime": startTime.text,
      });
      print(response);
      if (response != null) {
        print('home');
        Get.to(() =>  adminaddticket());
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



            Form(

              child: Column(
                children: [
                  textfilednamemahata(
                    textfield: ":أدخل إسم المحطة ",
                    text: "إسم المحطة",
                    mycontroller: to,
                    validator: (val) {
                      if (val!.isEmpty) {
                        return "kcjccjjc";
                      }
                      return null;
                    },

                  ),
                  SizedBox(height: 10.h),
                  textfiledprice(
                    textfield: ":أدخل سعر الرحلة ",
                    text:"سعر الرحلة",
                    mycontroller: price,
                  ),
                  SizedBox(height: 10.h),
                  textfiledhours(
                    textfield: " :أدخل عدد ساعات الرحلة",
                    text:"ساعات الرحلة",
                    mycontroller: timeOfFlight,
                  ),
                  SizedBox(height: 10.h),
                  datefiled(

                    text:"تاريخ الانطلاق",
                    mycontroller: startTime,
                  ),
                  SizedBox(height: 10.h),
                  textfiledwousoul(

                    text:"تاريخ الوصول",
                    mycontroller: endTime,
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
