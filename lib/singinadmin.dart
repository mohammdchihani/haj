// import 'dart:ui';
//
// import 'package:commerce/screens/adminopereating.dart';
// import 'package:commerce/screens/bottom_bar.dart';
// import 'package:commerce/singup.dart';
// import 'package:commerce/textstyle.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_screenutil/flutter_screenutil.dart';
// import 'package:flutter_svg/svg.dart';
// import 'package:get/get.dart';
// import 'package:lottie/lottie.dart';
//
//
// import 'APPBAR.dart';
// import 'buttons/singupbutton.dart';
// import 'colors.dart';
// import 'inputs/textfiledemail0singup.dart';
// import 'inputs/textfiledsinginemailvalid.dart';
// import 'inputs/textfiledsinginpassvald.dart';
//
//
// class Singinadmin extends StatefulWidget {
//   Singinadmin({Key? key}) : super(key: key);
//
//   @override
//   _SinginadminState createState() => _SinginadminState();
// }
//
// class _SinginadminState extends State<Singinadmin> {
//
//
//   bool isLoading = false;
//
//   @override
//   void initState() {
//     super.initState();
//
//   }
//
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       resizeToAvoidBottomInset: false,
//       appBar: CustomAppBar(title: ''),
//       backgroundColor: LightColors.lightColor1,
//       body: isLoading
//           ? _buildLoadingWidget()
//           : _buildContentWidget(),
//     );
//   }
//
//   Widget _buildLoadingWidget() {
//     return Center(
//       child: Lottie.asset(
//         "assets/animations/Animation - 1713222836422.json",
//         height: 100.h,
//         width: 100.w,
//         repeat: true,
//         animate: true,
//       ),
//     );
//   }
//
//   Widget _buildContentWidget() {
//     return Padding(
//       padding: EdgeInsets.fromLTRB(0, ScreenUtil().setHeight(5.r), 0, 0,),
//       child:  Container(
//         decoration: BoxDecoration(
//           color: LightColors.lightColor1,
//           borderRadius: BorderRadius.only(
//             topLeft: Radius.circular(30.h),
//             topRight: Radius.circular(30.h),
//           ),
//         ),
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: [
//             SvgPicture.asset(
//               'assets/images/Cream and Green Simple Minimalist Islamic Travel Agency Logo.svg', // Provide the correct path to your SVG file
//               height: 140.0,
//               width: 140.0,
//             ),
//             SizedBox(height: 10.h,),
//             Text(
//               "  تطبيق بارع للحج",
//               style: Styles.textwelcomlogin,
//               textAlign: TextAlign.center,
//             ),
//             SizedBox(height: 48.h),
//             Form(
//
//               child: Column(
//                 children: [
//                   CustomEmailField5(
//                     textfield: "أدخل البريد الإلكتروني",
//                     text: ":البريد الإلكتروني",
//                     validator: (val) {
//                       if (val!.isEmpty) {
//                         return "kcjccjjc";
//                       }
//                       return null;
//                     },
//
//                   ),
//                   SizedBox(height: 10.h),
//                   Custom0pass(
//                     textfield: "أدخل كلمة السر",
//                     text:":كلمة السر",
//
//                   ),
//                 ],
//               ),
//             ),
//             SizedBox(height: 32.h),
//             CustomButton(
//               text: "دخول",
//               onPressed: () async {
//                 Get.to(() =>  adminoperation());
//
//               },
//             ),
//             SizedBox(height: 8.h),
//             SizedBox(height: 1.h),
//           ],
//         ),
//       ),
//     );
//   }
// }
