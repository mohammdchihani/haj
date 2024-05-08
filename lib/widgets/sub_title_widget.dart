
import 'package:flutter/material.dart';

class SubTitleWidget extends StatelessWidget {
  final String bigText;
  final String smallText;
  const SubTitleWidget({
    Key? key,
    required this.bigText,
    required this.smallText,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          bigText,

        ),
        InkWell(
          onTap: () {
            debugPrint("It is tapped");
          },
          child: Text(
            smallText,

          ),
        )
      ],
    );
  }
}
