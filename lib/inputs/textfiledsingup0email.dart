// import 'package:flutter/material.dart';
// import 'package:flutter_screenutil/flutter_screenutil.dart';
// import '../../styles/colors.dart';
// import '../../styles/text_styles.dart';
//
// final formKey2email = GlobalKey<FormState>();
//
// class CustomEmailField2 extends StatefulWidget {
//   final String? text;
//   final String? hintText;
//   final TextEditingController? mycontroller;
//   final String? Function(String?)? validator;
//
//   CustomEmailField2({
//     Key? key,
//     this.text,
//     this.hintText,
//     this.mycontroller,
//     this.validator, required String textfield,
//   }) : super(key: key);
//
//   @override
//   _CustomEmailField2State createState() => _CustomEmailField2State();
// }
//
// class _CustomEmailField2State extends State<CustomEmailField2> {
//   bool _hasError = false;
//
//   @override
//   Widget build(BuildContext context) {
//     return SingleChildScrollView(
//       child: Padding(
//         padding: EdgeInsets.symmetric(horizontal: 25.0.w),
//         child: Form(
//           key: formKey2email,
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
//                 controller: widget.mycontroller,
//                 autovalidateMode: AutovalidateMode.disabled,
//                 onTap: () {
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
//                   ),
//                   errorMaxLines: 1,
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
//                   hintText: widget.hintText ?? 'البريد الإلكتروني',
//                 ),
//                 validator: (value) {
//                   if (value == null || value.isEmpty) {
//                     setState(() {
//                       _hasError = true;
//                     });
//                     return 'الرجاء إدخال عنوان بريد إلكتروني';
//                   }
//                   if (!RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$').hasMatch(value)) {
//                     setState(() {
//                       _hasError = true;
//                     });
//                     return 'الرجاء إدخال عنوان بريد إلكتروني صالح';
//                   }
//                   setState(() {
//                     _hasError = false;
//                   });
//                   return null;
//                 },
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }
