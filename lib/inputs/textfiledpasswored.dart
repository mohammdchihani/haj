// import 'package:flutter/material.dart';
// import 'package:flutter_screenutil/flutter_screenutil.dart';
// import '../../styles/colors.dart';
// import '../../styles/text_styles.dart';
//
// class Custom2 extends StatefulWidget {
//   final String? text;
//   final String? textfield;
//   final TextEditingController? mycontroller;
//   final String? Function(String?)? validator;
//
//   Custom2({this.text, this.textfield, this.mycontroller, this.validator});
//
//   @override
//   _Custom2State createState() => _Custom2State();
// }
//
// class _Custom2State extends State<Custom2> {
//   bool obscureText = true;
//
//
//   @override
//   Widget build(BuildContext context) {
//     return Padding(
//       padding: EdgeInsets.symmetric(horizontal: 25.0.w),
//       child: Column(
//         children: [
//           if (widget.text != null)
//             Align(
//               alignment: Alignment.centerRight,
//               child: Text(
//                 widget.text!,
//                 style: Styles.textnormal,
//               ),
//             ),
//           SizedBox(height: 7.h),
//           Container(
//             height: 43.h,
//             decoration: BoxDecoration(
//               color: MainColors.mainColor3,
//               borderRadius: BorderRadius.circular(8.h),
//               border: Border.all(
//                 color: MainColors.mainColor1,
//                 width: 2.0.w,
//               ),
//             ),
//             child: Padding(
//               padding: EdgeInsets.symmetric(horizontal: 8.0.w),
//               child: Row(
//                 mainAxisSize: MainAxisSize.min,
//                 children: [
//                   Expanded(
//                     child: Row(
//                       children: [
//                         IconButton(
//                           icon: Icon(
//                             obscureText ? Icons.visibility : Icons.visibility_off,
//                             color: MainColors.mainColor5,
//                           ),
//                           onPressed: () {
//                             setState(() {
//                               obscureText = !obscureText;
//                             });
//                           },
//                         ),
//                         Expanded(
//                           child: TextFormField(
//                             textAlign: TextAlign.right,
//                             style: Styles.tft,
//                             obscureText: obscureText,
//                             controller: widget.mycontroller,
//                             decoration: InputDecoration(
//                               border: InputBorder.none,
//                               hintText: widget.textfield ?? '',
//                             ),
//
//                           ),
//                         ),
//                       ],
//                     ),
//                   ),
//                 ],
//               ),
//             ),
//           ),
//         ],
//       ),
//     );
//   }
//
// }
