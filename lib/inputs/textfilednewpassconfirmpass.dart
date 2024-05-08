//
// import 'package:flutter/material.dart';
// import 'package:flutter_screenutil/flutter_screenutil.dart';
// import '../../styles/colors.dart';
// import '../../styles/text_styles.dart';
//
// final formkeypass2 = GlobalKey<FormState>();
//
// class Custom2pass extends StatefulWidget {
//   final String? text;
//   final String? textfield;
//   final TextEditingController? mycontroller;
//   final String? Function(String?)? validator;
//
//   Custom2pass({
//     Key? key,
//     this.text,
//     this.textfield,
//     this.mycontroller,
//     this.validator,
// // Add formKey parameter
//   }) : super(key: key);
//
//   @override
//   _Custom2passState createState() => _Custom2passState();
// }
//
// class _Custom2passState extends State<Custom2pass> {
//   bool _obscureText = true;
//   bool _hasError = false;
//
//   @override
//   Widget build(BuildContext context) {
//     return SingleChildScrollView(
//       child: Padding(
//         padding: EdgeInsets.symmetric(horizontal: 25.0.w),
//         child: Form(
//           key: formkeypass2,
//           child: Column(
//             mainAxisSize: MainAxisSize.min,
//             children: [
//               if (widget.text != null)
//                 Align(
//                   alignment: Alignment.centerRight,
//                   child: Text(
//                     widget.text!,
//                     style: Styles.textnormal,
//                   ),
//                 ),
//               SizedBox(height: 7.h),
//               TextFormField(
//                 textAlign: TextAlign.right,
//                 style: Styles.tft,
//                 obscureText: _obscureText,
//                 controller: widget.mycontroller,
//                 autovalidateMode: AutovalidateMode.disabled, // Always validate
//                 onTap: () {
//                   // Reset error state when the text field is tapped
//                   setState(() {
//                     _hasError = false;
//                   });
//                 },
//                 decoration: InputDecoration(
//                   filled: true,
//                   fillColor: MainColors.mainColor3,
//                   contentPadding: EdgeInsets.symmetric(horizontal: 8.0.w),
//                   errorStyle: TextStyle(
//                     height: 1.0,
//                     // Adjusted textAlign to right
//                   ),
//                   errorMaxLines: 1, // Set max lines for error text
//                   border: OutlineInputBorder(
//                     borderRadius: BorderRadius.circular(8.h),
//                     borderSide: BorderSide(
//                       color: MainColors.mainColor1,
//                       width: 2.0.w,
//                     ),
//                   ),
//                   focusedBorder: OutlineInputBorder(
//                     borderRadius: BorderRadius.circular(8.h),
//                     borderSide: BorderSide(
//                       color: MainColors.mainColor1,
//                       width: 2.0.w,
//                     ),
//                   ),
//                   hintText: widget.textfield ?? '',
//                   suffixIcon: IconButton(
//                     icon: Icon(
//                       _obscureText ? Icons.visibility : Icons.visibility_off,
//                       color: MainColors.mainColor5,
//                     ),
//                     onPressed: () {
//                       setState(() {
//                         _obscureText = !_obscureText;
//                       });
//                     },
//                   ),
//                 ),
//                 validator: (value) {
//                   if (value == null || value.isEmpty) {
//                     setState(() {
//                       _hasError = true;
//                     });
//                     return 'الرجاء إدخال كلمة المرور';
//                   }
//                   if (value.length < 8) {
//                     setState(() {
//                       _hasError = true;
//                     });
//                     return 'يجب أن تكون كلمة المرور على الأقل 8  أحرف';
//                   }
//                   if (value.length > 20) {
//                     setState(() {
//                       _hasError = true;
//                     });
//                     return 'يجب أن تكون كلمة المرور أقل من 20 حرفًا';
//                   }
//                   // if (!value.contains(RegExp(r'[0-9]'))) {
//                   //   setState(() {
//                   //     _hasError = true;
//                   //   });
//                   //   return 'يجب أن تحتوي كلمة المرور على رقم واحد على الأقل';
//                   // }
//                   // if (!value.contains(RegExp(r'[!@#$%^&*(),.?":{}|<>]'))) {
//                   //   setState(() {
//                   //     _hasError = true;
//                   //   });
//                   //   return 'يجب أن تحتوي كلمة المرور على رمز خاص واحد على الأقل';
//                   // }
//                   if (value.contains(RegExp(r'\s'))) {
//                     setState(() {
//                       _hasError = true;
//                     });
//                     return 'يجب أن لا تحتوي كلمة المرور على مسافات';
//                   }
//                   // يمكنك إضافة شروط التحقق المعقدة الأخرى هنا إذا لزم الأمر
//                   setState(() {
//                     _hasError = false;
//                   });
//                   return null; // إرجاع قيمة null إذا كانت كلمة المرور صالحة
//                 },
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }