import 'package:commerce/screens/ticket.dart';

import 'package:commerce/screens/haj.dart';
import 'package:flashy_tab_bar2/flashy_tab_bar2.dart';
import 'package:fluentui_icons/fluentui_icons.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';


import '../colors.dart';
import 'home_screen.dart';

class BottomBar extends StatefulWidget {
  const BottomBar({Key? key}) : super(key: key);

  @override
  State<BottomBar> createState() => _BottomBarState();
}

class _BottomBarState extends State<BottomBar> {
  int _selectedIndex = 2;

  static final List<Widget> _widgetOptions = <Widget>[
    const ticketScreen(),
    const hajScreen(),
     const HomeScreen(),
  ];

  // OnTabItem Method
  void _onTapItem(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: _widgetOptions[_selectedIndex],
      ),
      bottomNavigationBar: FlashyTabBar(
        selectedIndex: _selectedIndex,
        onItemSelected: _onTapItem,
        animationDuration: const Duration(milliseconds: 400),
        items: [
          FlashyTabBarItem(
            icon: Icon(Icons.airplane_ticket_outlined),
            activeColor: Colors.blueGrey,
            inactiveColor: const Color(0xFF526480),
            title: Text("التذكرة",
              style: TextStyle(
                fontFamily: 'Tajawal',
                color: MainColors.mainColor4,
                fontSize: 14.0.sp,
                fontWeight: FontWeight.bold,
              ),),
          ),
          FlashyTabBarItem(
            icon: Icon(Icons.library_books),
            activeColor: Colors.blueGrey,
            inactiveColor: const Color(0xFF526480),
            title: Text("دفتر الحاج",
              style: TextStyle(
                fontFamily: 'Tajawal',
                color: MainColors.mainColor4,
                fontSize: 14.0.sp,
                fontWeight: FontWeight.bold,
              ),),
          ),
      FlashyTabBarItem(
            icon: Icon(Icons.airplanemode_on_rounded),
            activeColor: Colors.blueGrey,
            inactiveColor: const Color(0xFF526480),
            title: Text("المطارات",
              style: TextStyle(
                fontFamily: 'Tajawal',
                color: MainColors.mainColor4,
                fontSize: 14.0.sp,
                fontWeight: FontWeight.bold,
              ),),
          ),
        ],
      ),

    );
  }
}
