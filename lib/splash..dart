import 'package:commerce/textstyle.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

import 'Singin.dart';



class SplashPage extends StatefulWidget {
  static final Color splashColor = Colors.white;

  @override
  _SplashPageState createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _opacityAnimation;

  @override
  void initState() {
    super.initState();

    _controller = AnimationController(
      duration: Duration(seconds: 2), // Adjust the duration as needed
      vsync: this,
    );

    _opacityAnimation = Tween<double>(
      begin: 0.0,
      end: 1.0,
    ).animate(_controller);

    // Start the animation after a delay
    Future.delayed(Duration(seconds: 1), () {
      _controller.forward();
    });

    // Navigate to the next screen after the animation completes
    _controller.addStatusListener((status) {
      if (status == AnimationStatus.completed) {
        Get.off(() =>Singin());
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: SplashPage.splashColor,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            FadeTransition(
              opacity: _opacityAnimation,
              child:SvgPicture.asset(
                'assets/images/Cream and Green Simple Minimalist Islamic Travel Agency Logo.svg', // Provide the correct path to your SVG file
                height: 140.0,
                width: 140.0,
              ),

            ),
            FadeTransition(
              opacity: _opacityAnimation,
              child: Text(
               "تطبيق بارع للحج",
                style: Styles.textwelcomlogin,
              ),
            ),
          ],
        ),
      ),
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }
}
