// import 'package:commerce/app/core/styles/colors.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_screenutil/flutter_screenutil.dart';
//
// import '../../styles/text_styles.dart';
//
// class Custombirth extends StatefulWidget {
//   final String text2;
//   const Custombirth({Key? key, required this.text2}) : super(key: key);
//
//   @override
//   _CustombirthState createState() => _CustombirthState();
// }
//
// class _CustombirthState extends State<Custombirth> {
//   late TextEditingController _controller;
//
//   @override
//   void initState() {
//     super.initState();
//     _controller = TextEditingController();
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Column(
//       crossAxisAlignment: CrossAxisAlignment.end,
//       children: [
//         Text(
//           widget.text2,
//           style: Styles.textnormal,
//           maxLines: 1, // Limit the number of lines if necessary
//           overflow: TextOverflow.ellipsis, // Handle overflow with ellipsis if necessary
//         ),
//         SizedBox(height: 5.h),
//         Container(
//           height: 43.0.h,
//           width: 280.0.w,
//           decoration: BoxDecoration(
//             color: MainColors.mainColor3, // Replace with your desired color
//             borderRadius: BorderRadius.circular(8.0),
//             border: Border.all(
//               color:MainColors.mainColor1, // Replace with your desired color
//               width: 2.0.w,
//             ),
//           ),
//           child: Padding(
//             padding: EdgeInsets.symmetric(horizontal: 8.0),
//             child: TextField(
//               controller: _controller,
//               textAlign: TextAlign.right,
//               decoration: InputDecoration(
//                 hintText: 'DD/MM/YYYY',
//                 hintStyle: Styles.textnormal.copyWith(color: Colors.grey),
//                 border: InputBorder.none,
//               ),
//               style: Styles.textnormal,
//               onChanged: (value) {
//                 if (value.length == 2 || value.length == 5) {
//                   _controller.text = '$value/';
//                   _controller.selection = TextSelection.fromPosition(
//                       TextPosition(offset: _controller.text.length));
//                 }
//               },
//             ),
//           ),
//         ),
//       ],
//     );
//   }
//
//   @override
//   void dispose() {
//     _controller.dispose();
//     super.dispose();
//   }
// }
