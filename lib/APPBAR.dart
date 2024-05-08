import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  const CustomAppBar({Key? key, required this.title}) : super(key: key);
  final String title;

  @override
  Size get preferredSize => Size.fromHeight(60.r);
  get onSelected => null; // Set a custom height
  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: Colors.transparent,
      elevation: 0,
      flexibleSpace: Stack(
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.center,

          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              // Place the photo (SvgPicture) above the text
            ],
          ),
        ],
      ),
    );
  }
}
