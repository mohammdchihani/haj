// import 'package:flutter/material.dart';
// import 'package:flutter_screenutil/flutter_screenutil.dart';
//
// import '../../styles/colors.dart';
// import '../../styles/text_styles.dart';
//
// class Customdropdown extends StatefulWidget {
//   final List<String> dropdownItems;
//   final String selectedDropdownItem;
//   final String text2;
//
//   Customdropdown({
//     Key? key,
//     required this.dropdownItems,
//     required this.selectedDropdownItem,
//     required this.text2,
//   }) : super(key: key);
//
//   @override
//   _CustomdropdownState createState() => _CustomdropdownState();
// }
//
// class _CustomdropdownState extends State<Customdropdown> {
//   late String _selectedItem;
//
//   @override
//   void initState() {
//     super.initState();
//     _selectedItem = widget.selectedDropdownItem;
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
//               color: MainColors.mainColor1, // Replace with your desired color
//               width: 2.0.w,
//             ),
//           ),
//           child: Padding(
//             padding: EdgeInsets.symmetric(horizontal: 8.0),
//             child: Row(
//               mainAxisAlignment: MainAxisAlignment.end,
//               children: [
//                 DropdownButton<String>(
//                   value: _selectedItem,
//                   items: widget.dropdownItems.map((String value) {
//                     return DropdownMenuItem<String>(
//                       value: value,
//                       child: Text(
//                         value,
//                         style: Styles.textnormal2,
//                         maxLines: 1, // Limit the number of lines if necessary
//                         overflow: TextOverflow.ellipsis,
//                       ),
//                     );
//                   }).toList(),
//                   onChanged: (String? newValue) {
//                     if (newValue != null) {
//                       setState(() {
//                         _selectedItem = newValue;
//                       });
//                     }
//                   },
//                 ),
//               ],
//             ),
//           ),
//         ),
//       ],
//     );
//   }
// }
