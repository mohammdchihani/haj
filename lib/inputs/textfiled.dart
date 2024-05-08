// import 'package:flutter/material.dart';
// import 'package:flutter_screenutil/flutter_screenutil.dart';
// import 'package:commerce/app/core/styles/colors.dart';
// import 'package:commerce/app/core/styles/text_styles.dart';
//
// class CombinedTextFieldWidget extends StatefulWidget {
//   final TextEditingController? mycontroller;
//   final String? textfield;
//   final String? secondTextfield;
//   final String? svgIconPath;
//   final String? text;
//   final String? Function(String?)? validator;
//
//   const CombinedTextFieldWidget({
//     Key? key,
//     this.mycontroller,
//     this.textfield,
//     this.secondTextfield,
//     this.svgIconPath,
//     this.text,
//     this.validator,
//   }) : super(key: key);
//
//   @override
//   _CombinedTextFieldWidgetState createState() => _CombinedTextFieldWidgetState();
// }
//
// class _CombinedTextFieldWidgetState extends State<CombinedTextFieldWidget> {
//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       width: double.infinity,
//       padding: EdgeInsets.symmetric(horizontal: 25.0.r),
//
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.end,
//           children: [
//             if (widget.text != null)
//               Text(
//                 widget.text!,
//                 style: Styles.textnormal,
//                 maxLines: 1, // Limit the number of lines if necessary
//                 overflow: TextOverflow.ellipsis, // Handle overflow with ellipsis if necessary
//               ),
//             SizedBox(height: 10.0.h),
//             Container(
//               height: 43.0.h,
//               decoration: BoxDecoration(
//                 color: MainColors.mainColor3,
//                 borderRadius: BorderRadius.circular(8.0.h),
//                 border: Border.all(
//                   color: MainColors.mainColor1,
//                   width: 2.0.w,
//                 ),
//               ),
//               child: Padding(
//                 padding: EdgeInsets.symmetric(horizontal: 8.0.w),
//                 child: Row(
//                   children: [
//                     Expanded(
//                       child: TextFormField(
//                         controller: widget.mycontroller,
//                         textAlign: TextAlign.right,
//                         style: Styles.tft,
//
//                         decoration: InputDecoration(
//                           border: InputBorder.none,
//                           hintText: widget.textfield ?? '',
//
//                         ),
//                       ),
//                     ),
//                   ],
//                 ),
//               ),
//             ),
//           ],
//         ),
//
//     );
//   }
// }
