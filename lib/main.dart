import 'package:commerce/splash..dart';
import 'package:device_preview/device_preview.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

import 'package:flutter/rendering.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:get/get_navigation/src/routes/get_route.dart';


void main() {
  return runApp(

    DevicePreview(
      enabled: !kReleaseMode,
      builder: (context) => MyApp(),
    ),
  );
}
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(355, 690),
      builder: (context, child) {
        return GetMaterialApp(

          debugShowCheckedModeBanner: false,

          theme: ThemeData(
            primarySwatch: Colors.blue,
            textTheme: Typography.englishLike2018.apply(fontSizeFactor: 1.sp),
          ),
          home: child,
        );
      },
      child:SplashPage(), // Replace with the correct class name for the sign-up widget
    );
  }
}


// import 'package:flutter/foundation.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter/rendering.dart';
// import 'package:flutter_screenutil/flutter_screenutil.dart';
// import 'package:get/get_navigation/src/root/get_material_app.dart';
// import 'package:get/get_navigation/src/routes/get_route.dart';
// import 'package:device_preview/device_preview.dart';
//
// import 'app/modules/home/views/favorit.dart';
// import 'app/modules/home/views/home.dart';
// import 'app/modules/sign_in/views/sign_in_view.dart';
// import 'app/modules/sing_up/views/sing_up.dart';
// import 'app/modules/splash/views/splash_view.dart';
//
// void main() {
//   return runApp(
//     DevicePreview(
//       enabled: !kReleaseMode,
//       builder: (context) => RotatedBox(
//         quarterTurns: 180, // Rotate the app 90 degrees clockwise
//         child: MyApp(),
//       ),
//     ),
//   );
// }
//
// class MyApp extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return ScreenUtilInit(
//       designSize: const Size(355, 690),
//       builder: (context, child) {
//         return GetMaterialApp(
//           debugShowCheckedModeBanner: false,
//           theme: ThemeData(
//             primarySwatch: Colors.blue,
//             textTheme: Typography.englishLike2018.apply(fontSizeFactor: 1.sp),
//           ),
//           home: child,
//         );
//       },
//       child: SplashPage(), // Replace with the correct class name for the sign-up widget
//     );
//   }
// }
