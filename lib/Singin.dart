import 'dart:ui';

import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:commerce/screens/adminlogin.dart';
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


import 'APPBAR.dart';
import 'Crud.dart';
import 'buttons/singupbutton.dart';
import 'colors.dart';
import 'endpoint.dart';
import 'inputs/textfiledemail0singup.dart';
import 'inputs/textfiledsinginemailvalid.dart';
import 'inputs/textfiledsinginpassvald.dart';


class Singin extends StatefulWidget {
  Singin({Key? key}) : super(key: key);

  @override
  _SinginState createState() => _SinginState();
}

class _SinginState extends State<Singin> {
  final Crud _crud = Crud();
  TextEditingController email = TextEditingController();
  TextEditingController password = TextEditingController();
  GlobalKey<FormState> formKey = GlobalKey<FormState>();

  bool isLoading = false;
  Future<void> signIn() async {
    setState(() {
      isLoading = true;
    });
    try {
      var response = await _crud.postRequest(APIEndpoints.login, {
        "email": email.text,
        "password": password.text,
      });
 print("$email");
      print(response.toString());
      if (response != null) {
        print('home');
        Get.to(() =>  BottomBar());
      } else {
        print('Signin failed');
      }
    } catch (e) {
      print('Error during signin: $e');
      // Show AwesomeDialog for the error
      showUserExistsDialog(context);
    } finally {
      setState(() {
        isLoading = false;
      });
    }
  }

  void showUserExistsDialog(BuildContext context) {
    AwesomeDialog(
      context: context,
      dialogType: DialogType.error,
      animType: AnimType.rightSlide,
      title: 'هناك خطأ',
      titleTextStyle: TextStyle(color: MainColors.mainColor1),
      descTextStyle: TextStyle(color: MainColors.mainColor4),
      desc: 'هناك خطأ في البريد الإلكتروني أو كلمة السر',
      btnCancelOnPress: () {},
      btnOkOnPress: () {},
    ).show();
  }
  @override
  void initState() {
    super.initState();

  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: CustomAppBar(title: ''),
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
            SizedBox(height: 10.h,),
            Text(
              "  تطبيق بارع للحج",
              style: Styles.textwelcomlogin,
              textAlign: TextAlign.center,
            ),
            SizedBox(height: 48.h),
            Form(

              child: Column(
                children: [
                  CustomEmailField5(
                    textfield: "أدخل البريد الإلكتروني",
                    text: ":البريد الإلكتروني",
                    mycontroller: email,
                    validator: (val) {
                      if (val!.isEmpty) {
                        return "kcjccjjc";
                      }
                      return null;
                    },
                  ),
                  SizedBox(height: 10.h),
                  Custom0pass(
                    textfield: "أدخل كلمة السر",
                    text:":كلمة السر",
                    mycontroller:password,
                  ),
                ],
              ),
            ),
            SizedBox(height: 32.h),
            CustomButton(
              text: "دخول",
              onPressed: () async {
                signIn();

              },
            ),
            SizedBox(height: 8.h),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                TextButton(
                  onPressed: () {
                  Get.to(() => Singup());
                  },
                  child: Text(
                  "إنشاء حساب",
                    style: Styles.textmudiem,
                  ),
                ),
                TextButton(
                  onPressed: () {
                    Get.to(() => Singinadmin());
                  },
                  child: Text(
                    "تسجيل الدخول كمدير",
                    style: Styles.textmudiem,
                  ),
                ),

              ],
            ),
            SizedBox(height: 1.h),
          ],
        ),
      ),
    );
  }
}
