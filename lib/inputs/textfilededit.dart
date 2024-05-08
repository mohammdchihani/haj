// import 'package:flutter/material.dart';
// import 'package:flutter_screenutil/flutter_screenutil.dart';
// import 'package:commerce/app/core/styles/colors.dart';
// import 'package:commerce/app/core/styles/text_styles.dart';
//
// class textfilededit extends StatefulWidget {
//   final TextEditingController? mycontroller;
//   final String? textfield;
//   final String? secondTextfield;
//   final String? svgIconPath;
//   final String? text;
//   final String? Function(String?)? validator;
//   final String hintText; // Add required hintText parameter
//
//   const textfilededit({
//     Key? key,
//     this.mycontroller,
//     this.textfield,
//     this.secondTextfield,
//     this.svgIconPath,
//     this.text,
//     this.validator,
//     required this.hintText, // Mark hintText as required
//   }) : super(key: key);
//
//   @override
//   _textfilededit createState() => _textfilededit();
// }
//
// class _textfilededit extends State<textfilededit> {
//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       width: double.infinity,
//       padding: EdgeInsets.symmetric(horizontal: 25.0.r),
//
//       child: Column(
//         crossAxisAlignment: CrossAxisAlignment.end,
//         children: [
//           if (widget.text != null)
//             Text(
//               widget.text!,
//               style: Styles.textnormal,
//               maxLines: 1, // Limit the number of lines if necessary
//               overflow: TextOverflow.ellipsis, // Handle overflow with ellipsis if necessary
//             ),
//           SizedBox(height: 10.0.h),
//           Container(
//             height: 43.0.h,
//             decoration: BoxDecoration(
//               color: MainColors.mainColor3,
//               borderRadius: BorderRadius.circular(8.0.h),
//               border: Border.all(
//                 color: MainColors.mainColor1,
//                 width: 2.0.w,
//               ),
//             ),
//             child: Padding(
//               padding: EdgeInsets.symmetric(horizontal: 8.0.w),
//               child: Row(
//                 children: [
//                   Expanded(
//                     child: TextFormField(
//                       controller: widget.mycontroller,
//                       textAlign: TextAlign.right,
//                       style: Styles.tft,
//                       decoration: InputDecoration(
//                         border: InputBorder.none,
//                         hintText: widget.hintText, // Use required hintText parameter here
//                       ),
//                     ),
//                   ),
//                 ],
//               ),
//             ),
//           ),
//         ],
//       ),
//
//     );
//   }
// }
