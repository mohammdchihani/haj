
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';


import '../utils/app_layout.dart';

class ColumnLayout extends StatelessWidget {
  final CrossAxisAlignment alignment;
  final String firstText;
  final String secondText;
  final bool? isColor;

  const ColumnLayout({
    Key? key,
    required this.firstText,
    required this.secondText,
    required this.alignment,
    this.isColor,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: alignment,
      children: [
        Text(
          firstText,
    style: TextStyle(
      color: Colors.black    ),
        ),
        Text(
          secondText,
        style: TextStyle(
        color: Colors.black    ),

        )
      ],
    );
  }
}
