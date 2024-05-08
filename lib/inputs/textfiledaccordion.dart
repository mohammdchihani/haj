// import 'package:flutter/material.dart';
// import 'package:flutter_screenutil/flutter_screenutil.dart';
// import '../../styles/text_styles.dart';
//
// class AccordionItem extends StatefulWidget {
//   final String title;
//   final Widget content;
//
//   AccordionItem({Key? key, required this.title, required this.content})
//       : super(key: key);
//
//   @override
//   _AccordionItemState createState() => _AccordionItemState();
// }
//
// class _AccordionItemState extends State<AccordionItem> {
//   bool _expanded = false;
//
//   @override
//   Widget build(BuildContext context) {
//     return Column(
//       crossAxisAlignment: CrossAxisAlignment.end,
//       children: <Widget>[
//         InkWell(
//           onTap: () {
//             setState(() {
//               _expanded = !_expanded;
//             });
//           },
//           child: Padding(
//             padding: EdgeInsets.symmetric(vertical: 10.0, horizontal: 15.0),
//             child: Row(
//               mainAxisAlignment: MainAxisAlignment.spaceBetween,
//               children: <Widget>[
//                 Expanded(
//                   child: Align(
//                     alignment: Alignment.centerRight,
//                     child: Text(
//                       widget.title,
//                       style: Styles.textm,
//                     ),
//                   ),
//                 ),
//                 Icon(
//                   _expanded ? Icons.expand_less : Icons.expand_more,
//                   size: 30.0,
//                 ),
//               ],
//             ),
//           ),
//         ),
//         _expanded
//             ? Padding(
//           padding: EdgeInsets.symmetric(horizontal: 15.0),
//           child: Align(
//             alignment: Alignment.topRight,
//             child: DefaultTextStyle(
//               style: TextStyle(color: Colors.black,
//               fontFamily:  'Tajawal',
//                 fontSize: 13.sp
//               ), // Set text color to black
//               child: widget.content,
//             ),
//           ),
//         )
//             : SizedBox.shrink(),
//         Divider(
//           thickness: 1.0,
//           color: Colors.grey,
//         ),
//       ],
//     );
//   }
// }
