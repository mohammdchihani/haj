
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../Crud.dart';
import '../colors.dart';
import '../endpoint.dart';
import '../views/ticket_view.dart';
import '../widgets/sub_title_widget.dart';
import 'addadmin.dart';
import 'package:commerce/booking.dart';

import 'adminaddticket.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final Crud _crud = Crud();
  late List data;

  Future<List> airport() async {
    try {
      var response = await _crud.getRequest(APIEndpoints.adminaddair);
      data = response;
      print(data);
      if (response == 200) {
        return data;
      } else {
        print('Signup failed');
        return [];
      }
    } catch (e) {
      print('Error during signup: $e');
      // Show AwesomeDialog for the error
      // showUserExistsDialog(context);
      return [];
    }
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
            backgroundColor: MainColors.mainColor9,
            appBar: AppBar(
              backgroundColor: MainColors.mainColor1,
              elevation: 0,
              centerTitle: true,
              title: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'المطارات المتوفرة',
                    style: TextStyle(
                      fontFamily: 'Tajawal',
                      color: MainColors.mainColor3,
                      fontWeight: FontWeight.bold,
                      fontSize: 22.0.sp,
                    ),
                  ),
                  SizedBox(width: 8.w),
                  Icon(
                    Icons.airplanemode_on_rounded,
                    color: Colors.white,
                    size: 25.sp,
                  ),
                ],
              ),
              iconTheme: IconThemeData(
                color: Colors.white,
              ),
              leading: IconButton(
                icon: Icon(Icons.arrow_back),
                onPressed: () {
                  Navigator.of(context).pop(); // Navigate back to the previous screen
                },
              ),
            ),

            body: Column(
              children: [ SizedBox(height: 20.h,),
                Expanded(
                  child: FutureBuilder(
                    future: airport(),
                    builder: (context, snapshot) {
                      if (snapshot.connectionState == ConnectionState.waiting) {
                        return Center(child: CircularProgressIndicator());
                      } else if (snapshot.hasError) {
                        return Center(child: Text('Error: ${snapshot.error}'));
                      } else {
                        return ListView.builder(
                          itemCount: data.length,
                          itemBuilder: (context, index) {
                            var airportData = data[index];
                            return Column(
                              children: [
                                TextButton(
                                  onPressed: () {
                                    Get.to(() =>  booking(airportId: airportData["id"])); // Add your button press logic here
                                  },
                                  child: Card(
                                    color: Colors.white, // Set background color to white
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(15.0),
                                    ),
                                    elevation: 0.8, // Add elevation for a shadow effect
                                    child: Row(
                                      children: [
                                        Expanded(
                                          flex: 2,
                                          child: Padding(
                                            padding: EdgeInsets.all(8.0),
                                            child: Column(
                                              crossAxisAlignment: CrossAxisAlignment.center,
                                              children: [
                                                Text(
                                                  ' الامارتية', // Airport Name
                                                  style: TextStyle(
                                                    fontFamily: 'Tajawal',
                                                    color: MainColors.mainColor1,
                                                    fontSize: 18.0.sp,
                                                    fontWeight: FontWeight.bold,
                                                  ),
                                                ),
                                                SizedBox(height: 5.h),
                                                Text(
                                                  'الموقع: الإمارات العربية المتحدة', // Location: Airport Location
                                                  style: TextStyle(
                                                    fontFamily: 'Tajawal',
                                                    color: MainColors.mainColor4,
                                                    fontSize: 14.0.sp,
                                                    fontWeight: FontWeight.bold,
                                                  ),
                                                ),
                                                SizedBox(height: 5.h),
                                                Text(
                                                  'المحطة:الخطوط الجوية الامارتية', // Terminal: Terminal Name
                                                  style: TextStyle(
                                                    fontFamily: 'Tajawal',
                                                    color: MainColors.mainColor4,
                                                    fontSize: 14.0.sp,
                                                    fontWeight: FontWeight.bold,
                                                  ),
                                                ),
                                                SizedBox(height: 5.h),
                                                Text(
                                                  'البوابات: 08', // Gates: Gate Numbers
                                                  style: TextStyle(
                                                    fontFamily: 'Tajawal',
                                                    color: MainColors.mainColor4,
                                                    fontSize: 14.0.sp,
                                                    fontWeight: FontWeight.bold,
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                        ),
                                        Expanded(
                                          flex: 1,
                                          child: Container(
                                            width: 150.w, // Set width for the image container
                                            height: 110.h,
                                            decoration: BoxDecoration(
                                              borderRadius: BorderRadius.only(
                                                topLeft: Radius.circular(0.0),
                                                bottomLeft: Radius.circular(0.0),
                                                topRight: Radius.circular(15.0),
                                                bottomRight: Radius.circular(15.0),
                                              ),
                                              image: DecorationImage(
                                                fit: BoxFit.cover,
                                                image: AssetImage(
                                                  "assets/images/emarat.gif",
                                                ),
                                              ),
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                                SizedBox(height: 10.h,),
                                TextButton(
  onPressed: () {
    Get.to(() =>  booking()); // Add your button press logic here
  },
  child: Card(
    color: Colors.white, // Set background color to white
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(15.0),
    ),
    elevation: 0.8, // Add elevation for a shadow effect
    child: Row(
      children: [
        Expanded(
          flex: 2,
          child: Padding(
            padding: EdgeInsets.all(8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  'التركية', // Airport Name
                  style: TextStyle(
                    fontFamily: 'Tajawal',
                    color: MainColors.mainColor1,
                    fontSize: 18.0.sp,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: 5.h),
                Text(
                  'الموقع: شمال تركيا', // Location: Airport Location
                  style: TextStyle(
                    fontFamily: 'Tajawal',
                    color: MainColors.mainColor4,
                    fontSize: 14.0.sp,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: 5.h),
                Text(
                  'المحطة:الخطوط الجوية التركية', // Terminal: Terminal Name
                  style: TextStyle(
                    fontFamily: 'Tajawal',
                    color: MainColors.mainColor4,
                    fontSize: 14.0.sp,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: 5.h),
                Text(
                  'البوابات:04', // Gates: Gate Numbers
                  style: TextStyle(
                    fontFamily: 'Tajawal',
                    color: MainColors.mainColor4,
                    fontSize: 14.0.sp,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
          ),
        ),
        Expanded(
          flex: 1,
          child: Container(
            width: 150.w, // Set width for the image container
            height: 110.h,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(0.0),
                bottomLeft: Radius.circular(0.0),
                topRight: Radius.circular(15.0),
                bottomRight: Radius.circular(15.0),
              ),
              image: DecorationImage(
                fit: BoxFit.cover,
                image: AssetImage(
                  "assets/images/turkish.jpg",
                ),
              ),
            ),
          ),
        ),
      ],
    ),
  ),
),

TextButton(
  onPressed: () {
    Get.to(() =>  booking()); // Add your button press logic here
  },
  child: Card(
    color: Colors.white, // Set background color to white
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(15.0),
    ),
    elevation: 0.8, // Add elevation for a shadow effect
    child: Row(
      children: [
        Expanded(
          flex: 2,
          child: Padding(
            padding: EdgeInsets.all(8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  'القطرية', // Airport Name
                  style: TextStyle(
                    fontFamily: 'Tajawal',
                    color: MainColors.mainColor1,
                    fontSize: 18.0.sp,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: 5.h),
                Text(
                  'الموقع: شرق قطر', // Location: Airport Location
                  style: TextStyle(
                    fontFamily: 'Tajawal',
                    color: MainColors.mainColor4,
                    fontSize: 14.0.sp,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: 5.h),
                Text(
                  'المحطة:الخطوط الجويةالقطرية', // Terminal: Terminal Name
                  style: TextStyle(
                    fontFamily: 'Tajawal',
                    color: MainColors.mainColor4,
                    fontSize: 14.0.sp,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: 5.h),
                Text(
                  'البوابات: 06', // Gates: Gate Numbers
                  style: TextStyle(
                    fontFamily: 'Tajawal',
                    color: MainColors.mainColor4,
                    fontSize: 14.0.sp,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
          ),
        ),
        Expanded(
          flex: 1,
          child: Container(
            width: 180.w, // Set width for the image container
            height: 110.h,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(0.0),
                bottomLeft: Radius.circular(0.0),
                topRight: Radius.circular(15.0),
                bottomRight: Radius.circular(15.0),
              ),
              image: DecorationImage(
                fit: BoxFit.cover,
                image: AssetImage(
                  "assets/images/qatar.jpg",
                ),
              ),
            ),
          ),
        ),
      ],
    ),
  ),
),
TextButton(
  onPressed: () {
    Get.to(() =>  booking()); // Add your button press logic here
  },
  child: Card(
    color: Colors.white, // Set background color to white
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(15.0),
    ),
    elevation: 0.8, // Add elevation for a shadow effect
    child: Row(
      children: [
        Expanded(
          flex: 2,
          child: Padding(
            padding: EdgeInsets.all(8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  ' الامارتية', // Airport Name
                  style: TextStyle(
                    fontFamily: 'Tajawal',
                    color: MainColors.mainColor1,
                    fontSize: 18.0.sp,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: 5.h),
                Text(
                  'الموقع: الإمارات العربية المتحدة', // Location: Airport Location
                  style: TextStyle(
                    fontFamily: 'Tajawal',
                    color: MainColors.mainColor4,
                    fontSize: 14.0.sp,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: 5.h),
                Text(
                  'المحطة:الخطوط الجوية الامارتية', // Terminal: Terminal Name
                  style: TextStyle(
                    fontFamily: 'Tajawal',
                    color: MainColors.mainColor4,
                    fontSize: 14.0.sp,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: 5.h),
                Text(
                  'البوابات: 08', // Gates: Gate Numbers
                  style: TextStyle(
                    fontFamily: 'Tajawal',
                    color: MainColors.mainColor4,
                    fontSize: 14.0.sp,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
          ),
        ),
        Expanded(
          flex: 1,
          child: Container(
            width: 150.w, // Set width for the image container
            height: 110.h,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(0.0),
                bottomLeft: Radius.circular(0.0),
                topRight: Radius.circular(15.0),
                bottomRight: Radius.circular(15.0),
              ),
              image: DecorationImage(
                fit: BoxFit.cover,
                image: AssetImage(
                  "assets/images/emarat.gif",
                ),
              ),
            ),
          ),
        ),
      ],
    ),
  ),
),


                                SizedBox(height: 10.h),
                                TextButton(
                                  onPressed: () {
                                    Get.to(() => booking(airportId: airportData["id"]));
                                  },
                                  child: Card(
                                    color: Colors.white,
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(15.0),
                                    ),
                                    elevation: 0.8,
                                    child: Row(
                                      children: [
                                        Expanded(
                                          flex: 2,
                                          child: Padding(
                                            padding: EdgeInsets.all(8.0),
                                            child: Column(
                                              crossAxisAlignment: CrossAxisAlignment.center,
                                              children: [
                                                Text(
                                                  '${airportData["name"]}',
                                                  style: TextStyle(
                                                    fontFamily: 'Tajawal',
                                                    color: MainColors.mainColor1,
                                                    fontSize: 18.0.sp,
                                                    fontWeight: FontWeight.bold,
                                                  ),
                                                ),
                                                SizedBox(height: 5.h),
                                                Text(
                                                  'البلد: ${airportData["country"]}',
                                                  style: TextStyle(
                                                    fontFamily: 'Tajawal',
                                                    color: MainColors.mainColor4,
                                                    fontSize: 14.0.sp,
                                                    fontWeight: FontWeight.bold,
                                                  ),
                                                ),
                                                SizedBox(height: 5.h),
                                                Text(
                                                  'المدينة: ${airportData["city"]}',
                                                  style: TextStyle(
                                                    fontFamily: 'Tajawal',
                                                    color: MainColors.mainColor4,
                                                    fontSize: 14.0.sp,
                                                    fontWeight: FontWeight.bold,
                                                  ),
                                                ),
                                                SizedBox(height: 5.h),
                                                Text(
                                                  'البوابات: ${airportData["gates"]}',
                                                  style: TextStyle(
                                                    fontFamily: 'Tajawal',
                                                    color: MainColors.mainColor4,
                                                    fontSize: 14.0.sp,
                                                    fontWeight: FontWeight.bold,
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                        ),
                                        Expanded(
                                          flex: 1,
                                          child: Container(
                                            width: 150.w,
                                            height: 110.h,
                                            decoration: BoxDecoration(
                                              borderRadius: BorderRadius.only(
                                                topLeft: Radius.circular(0.0),
                                                bottomLeft: Radius.circular(0.0),
                                                topRight: Radius.circular(15.0),
                                                bottomRight: Radius.circular(15.0),
                                              ),
                                              image: DecorationImage(
                                                fit: BoxFit.cover,
                                                image: AssetImage(
                                                  "assets/images/emarat.gif",
                                                ),
                                              ),
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ],
                            );
                          },
                        );
                      }
                    },
                  ),
                ),
              ],
            )
        )

    );
  }
}







// import 'package:commerce/booking.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_screenutil/flutter_screenutil.dart';
// import 'package:get/get.dart';
// import 'package:get/get_core/src/get_main.dart';
// import '../colors.dart';
// import '../textstyle.dart';
// import '../utils/app_info_list.dart';
// import '../views/ticket_view.dart';
// import '../widgets/sub_title_widget.dart';
//
//
// class HomeScreen extends StatelessWidget {
//   const HomeScreen({Key? key});
//
//   @override
//   Widget build(BuildContext context) {
//     return SafeArea(
//       child: Scaffold(
//         backgroundColor: MainColors.mainColor9,
//         appBar: AppBar(
//           backgroundColor: MainColors.mainColor1, // Customize as needed
//           elevation: 0, // Remove shadow
//           centerTitle: true,
//           title: Row(
//             mainAxisAlignment: MainAxisAlignment.center,
//             children: [
//               Text(
//                 'المطارات المتوفرة',
//                 style: TextStyle(
//                   fontFamily: 'Tajawal',
//                   color: MainColors.mainColor3,
//                   fontWeight: FontWeight.bold,
//                   fontSize: 22.0.sp,
//                 ),
//               ),
//               SizedBox(width: 8.w),
//               Icon(
//                 Icons.airplanemode_on_rounded,
//                 color: Colors.white,
//                 size: 25.sp,
//               ),
//             ],
//           ),
//           iconTheme: IconThemeData(
//             color: Colors.white, // Set icon color to white
//           ),
//         ),
//         body: ListView(
//           padding: EdgeInsets.symmetric(horizontal: 10.w),
//           children: [
//             SizedBox(height: 25.h),
//             TextButton(
//               onPressed: () {
//                 Get.to(() =>  booking()); // Add your button press logic here
//               },
//               child: Card(
//                 color: Colors.white, // Set background color to white
//                 shape: RoundedRectangleBorder(
//                   borderRadius: BorderRadius.circular(15.0),
//                 ),
//                 elevation: 0.8, // Add elevation for a shadow effect
//                 child: Row(
//                   children: [
//                     Expanded(
//                       flex: 2,
//                       child: Padding(
//                         padding: EdgeInsets.all(8.0),
//                         child: Column(
//                           crossAxisAlignment: CrossAxisAlignment.center,
//                           children: [
//                             Text(
//                               ' الامارتية', // Airport Name
//                               style: TextStyle(
//                                 fontFamily: 'Tajawal',
//                                 color: MainColors.mainColor1,
//                                 fontSize: 18.0.sp,
//                                 fontWeight: FontWeight.bold,
//                               ),
//                             ),
//                             SizedBox(height: 5.h),
//                             Text(
//                               'الموقع: الإمارات العربية المتحدة', // Location: Airport Location
//                               style: TextStyle(
//                                 fontFamily: 'Tajawal',
//                                 color: MainColors.mainColor4,
//                                 fontSize: 14.0.sp,
//                                 fontWeight: FontWeight.bold,
//                               ),
//                             ),
//                             SizedBox(height: 5.h),
//                             Text(
//                               'المحطة:الخطوط الجوية الامارتية', // Terminal: Terminal Name
//                               style: TextStyle(
//                                 fontFamily: 'Tajawal',
//                                 color: MainColors.mainColor4,
//                                 fontSize: 14.0.sp,
//                                 fontWeight: FontWeight.bold,
//                               ),
//                             ),
//                             SizedBox(height: 5.h),
//                             Text(
//                               'البوابات: 08', // Gates: Gate Numbers
//                               style: TextStyle(
//                                 fontFamily: 'Tajawal',
//                                 color: MainColors.mainColor4,
//                                 fontSize: 14.0.sp,
//                                 fontWeight: FontWeight.bold,
//                               ),
//                             ),
//                           ],
//                         ),
//                       ),
//                     ),
//                     Expanded(
//                       flex: 1,
//                       child: Container(
//                         width: 150.w, // Set width for the image container
//                         height: 110.h,
//                         decoration: BoxDecoration(
//                           borderRadius: BorderRadius.only(
//                             topLeft: Radius.circular(0.0),
//                             bottomLeft: Radius.circular(0.0),
//                             topRight: Radius.circular(15.0),
//                             bottomRight: Radius.circular(15.0),
//                           ),
//                           image: DecorationImage(
//                             fit: BoxFit.cover,
//                             image: AssetImage(
//                               "assets/images/emarat.gif",
//                             ),
//                           ),
//                         ),
//                       ),
//                     ),
//                   ],
//                 ),
//               ),
//             ),
//
//
//
//           ],
//         ),
//       ),
//     );
//   }
// }



// TextButton(
//   onPressed: () {
//     Get.to(() =>  booking()); // Add your button press logic here
//   },
//   child: Card(
//     color: Colors.white, // Set background color to white
//     shape: RoundedRectangleBorder(
//       borderRadius: BorderRadius.circular(15.0),
//     ),
//     elevation: 0.8, // Add elevation for a shadow effect
//     child: Row(
//       children: [
//         Expanded(
//           flex: 2,
//           child: Padding(
//             padding: EdgeInsets.all(8.0),
//             child: Column(
//               crossAxisAlignment: CrossAxisAlignment.center,
//               children: [
//                 Text(
//                   'التركية', // Airport Name
//                   style: TextStyle(
//                     fontFamily: 'Tajawal',
//                     color: MainColors.mainColor1,
//                     fontSize: 18.0.sp,
//                     fontWeight: FontWeight.bold,
//                   ),
//                 ),
//                 SizedBox(height: 5.h),
//                 Text(
//                   'الموقع: شمال تركيا', // Location: Airport Location
//                   style: TextStyle(
//                     fontFamily: 'Tajawal',
//                     color: MainColors.mainColor4,
//                     fontSize: 14.0.sp,
//                     fontWeight: FontWeight.bold,
//                   ),
//                 ),
//                 SizedBox(height: 5.h),
//                 Text(
//                   'المحطة:الخطوط الجوية التركية', // Terminal: Terminal Name
//                   style: TextStyle(
//                     fontFamily: 'Tajawal',
//                     color: MainColors.mainColor4,
//                     fontSize: 14.0.sp,
//                     fontWeight: FontWeight.bold,
//                   ),
//                 ),
//                 SizedBox(height: 5.h),
//                 Text(
//                   'البوابات:04', // Gates: Gate Numbers
//                   style: TextStyle(
//                     fontFamily: 'Tajawal',
//                     color: MainColors.mainColor4,
//                     fontSize: 14.0.sp,
//                     fontWeight: FontWeight.bold,
//                   ),
//                 ),
//               ],
//             ),
//           ),
//         ),
//         Expanded(
//           flex: 1,
//           child: Container(
//             width: 150.w, // Set width for the image container
//             height: 110.h,
//             decoration: BoxDecoration(
//               borderRadius: BorderRadius.only(
//                 topLeft: Radius.circular(0.0),
//                 bottomLeft: Radius.circular(0.0),
//                 topRight: Radius.circular(15.0),
//                 bottomRight: Radius.circular(15.0),
//               ),
//               image: DecorationImage(
//                 fit: BoxFit.cover,
//                 image: AssetImage(
//                   "assets/images/turkish.jpg",
//                 ),
//               ),
//             ),
//           ),
//         ),
//       ],
//     ),
//   ),
// ),
//
// TextButton(
//   onPressed: () {
//     Get.to(() =>  booking()); // Add your button press logic here
//   },
//   child: Card(
//     color: Colors.white, // Set background color to white
//     shape: RoundedRectangleBorder(
//       borderRadius: BorderRadius.circular(15.0),
//     ),
//     elevation: 0.8, // Add elevation for a shadow effect
//     child: Row(
//       children: [
//         Expanded(
//           flex: 2,
//           child: Padding(
//             padding: EdgeInsets.all(8.0),
//             child: Column(
//               crossAxisAlignment: CrossAxisAlignment.center,
//               children: [
//                 Text(
//                   'القطرية', // Airport Name
//                   style: TextStyle(
//                     fontFamily: 'Tajawal',
//                     color: MainColors.mainColor1,
//                     fontSize: 18.0.sp,
//                     fontWeight: FontWeight.bold,
//                   ),
//                 ),
//                 SizedBox(height: 5.h),
//                 Text(
//                   'الموقع: شرق قطر', // Location: Airport Location
//                   style: TextStyle(
//                     fontFamily: 'Tajawal',
//                     color: MainColors.mainColor4,
//                     fontSize: 14.0.sp,
//                     fontWeight: FontWeight.bold,
//                   ),
//                 ),
//                 SizedBox(height: 5.h),
//                 Text(
//                   'المحطة:الخطوط الجويةالقطرية', // Terminal: Terminal Name
//                   style: TextStyle(
//                     fontFamily: 'Tajawal',
//                     color: MainColors.mainColor4,
//                     fontSize: 14.0.sp,
//                     fontWeight: FontWeight.bold,
//                   ),
//                 ),
//                 SizedBox(height: 5.h),
//                 Text(
//                   'البوابات: 06', // Gates: Gate Numbers
//                   style: TextStyle(
//                     fontFamily: 'Tajawal',
//                     color: MainColors.mainColor4,
//                     fontSize: 14.0.sp,
//                     fontWeight: FontWeight.bold,
//                   ),
//                 ),
//               ],
//             ),
//           ),
//         ),
//         Expanded(
//           flex: 1,
//           child: Container(
//             width: 180.w, // Set width for the image container
//             height: 110.h,
//             decoration: BoxDecoration(
//               borderRadius: BorderRadius.only(
//                 topLeft: Radius.circular(0.0),
//                 bottomLeft: Radius.circular(0.0),
//                 topRight: Radius.circular(15.0),
//                 bottomRight: Radius.circular(15.0),
//               ),
//               image: DecorationImage(
//                 fit: BoxFit.cover,
//                 image: AssetImage(
//                   "assets/images/qatar.jpg",
//                 ),
//               ),
//             ),
//           ),
//         ),
//       ],
//     ),
//   ),
// ),
// TextButton(
//   onPressed: () {
//     Get.to(() =>  booking()); // Add your button press logic here
//   },
//   child: Card(
//     color: Colors.white, // Set background color to white
//     shape: RoundedRectangleBorder(
//       borderRadius: BorderRadius.circular(15.0),
//     ),
//     elevation: 0.8, // Add elevation for a shadow effect
//     child: Row(
//       children: [
//         Expanded(
//           flex: 2,
//           child: Padding(
//             padding: EdgeInsets.all(8.0),
//             child: Column(
//               crossAxisAlignment: CrossAxisAlignment.center,
//               children: [
//                 Text(
//                   ' الامارتية', // Airport Name
//                   style: TextStyle(
//                     fontFamily: 'Tajawal',
//                     color: MainColors.mainColor1,
//                     fontSize: 18.0.sp,
//                     fontWeight: FontWeight.bold,
//                   ),
//                 ),
//                 SizedBox(height: 5.h),
//                 Text(
//                   'الموقع: الإمارات العربية المتحدة', // Location: Airport Location
//                   style: TextStyle(
//                     fontFamily: 'Tajawal',
//                     color: MainColors.mainColor4,
//                     fontSize: 14.0.sp,
//                     fontWeight: FontWeight.bold,
//                   ),
//                 ),
//                 SizedBox(height: 5.h),
//                 Text(
//                   'المحطة:الخطوط الجوية الامارتية', // Terminal: Terminal Name
//                   style: TextStyle(
//                     fontFamily: 'Tajawal',
//                     color: MainColors.mainColor4,
//                     fontSize: 14.0.sp,
//                     fontWeight: FontWeight.bold,
//                   ),
//                 ),
//                 SizedBox(height: 5.h),
//                 Text(
//                   'البوابات: 08', // Gates: Gate Numbers
//                   style: TextStyle(
//                     fontFamily: 'Tajawal',
//                     color: MainColors.mainColor4,
//                     fontSize: 14.0.sp,
//                     fontWeight: FontWeight.bold,
//                   ),
//                 ),
//               ],
//             ),
//           ),
//         ),
//         Expanded(
//           flex: 1,
//           child: Container(
//             width: 150.w, // Set width for the image container
//             height: 110.h,
//             decoration: BoxDecoration(
//               borderRadius: BorderRadius.only(
//                 topLeft: Radius.circular(0.0),
//                 bottomLeft: Radius.circular(0.0),
//                 topRight: Radius.circular(15.0),
//                 bottomRight: Radius.circular(15.0),
//               ),
//               image: DecorationImage(
//                 fit: BoxFit.cover,
//                 image: AssetImage(
//                   "assets/images/emarat.gif",
//                 ),
//               ),
//             ),
//           ),
//         ),
//       ],
//     ),
//   ),
// ),
//
// TextButton(
//   onPressed: () {
//     Get.to(() =>  booking()); // Add your button press logic here
//   },
//   child: Card(
//     color: Colors.white, // Set background color to white
//     shape: RoundedRectangleBorder(
//       borderRadius: BorderRadius.circular(15.0),
//     ),
//     elevation: 0.8, // Add elevation for a shadow effect
//     child: Row(
//       children: [
//         Expanded(
//           flex: 2,
//           child: Padding(
//             padding: EdgeInsets.all(8.0),
//             child: Column(
//               crossAxisAlignment: CrossAxisAlignment.center,
//               children: [
//                 Text(
//                   'التركية', // Airport Name
//                   style: TextStyle(
//                     fontFamily: 'Tajawal',
//                     color: MainColors.mainColor1,
//                     fontSize: 18.0.sp,
//                     fontWeight: FontWeight.bold,
//                   ),
//                 ),
//                 SizedBox(height: 5.h),
//                 Text(
//                   'الموقع: شمال تركيا', // Location: Airport Location
//                   style: TextStyle(
//                     fontFamily: 'Tajawal',
//                     color: MainColors.mainColor4,
//                     fontSize: 14.0.sp,
//                     fontWeight: FontWeight.bold,
//                   ),
//                 ),
//                 SizedBox(height: 5.h),
//                 Text(
//                   'المحطة:الخطوط الجوية التركية', // Terminal: Terminal Name
//                   style: TextStyle(
//                     fontFamily: 'Tajawal',
//                     color: MainColors.mainColor4,
//                     fontSize: 14.0.sp,
//                     fontWeight: FontWeight.bold,
//                   ),
//                 ),
//                 SizedBox(height: 5.h),
//                 Text(
//                   'البوابات:04', // Gates: Gate Numbers
//                   style: TextStyle(
//                     fontFamily: 'Tajawal',
//                     color: MainColors.mainColor4,
//                     fontSize: 14.0.sp,
//                     fontWeight: FontWeight.bold,
//                   ),
//                 ),
//               ],
//             ),
//           ),
//         ),
//         Expanded(
//           flex: 1,
//           child: Container(
//             width: 150.w, // Set width for the image container
//             height: 110.h,
//             decoration: BoxDecoration(
//               borderRadius: BorderRadius.only(
//                 topLeft: Radius.circular(0.0),
//                 bottomLeft: Radius.circular(0.0),
//                 topRight: Radius.circular(15.0),
//                 bottomRight: Radius.circular(15.0),
//               ),
//               image: DecorationImage(
//                 fit: BoxFit.cover,
//                 image: AssetImage(
//                   "assets/images/turkish.jpg",
//                 ),
//               ),
//             ),
//           ),
//         ),
//       ],
//     ),
//   ),
// ),
//
// TextButton(
//   onPressed: () {
//     Get.to(() =>  booking()); // Add your button press logic here
//   },
//   child: Card(
//     color: Colors.white, // Set background color to white
//     shape: RoundedRectangleBorder(
//       borderRadius: BorderRadius.circular(15.0),
//     ),
//     elevation: 0.8, // Add elevation for a shadow effect
//     child: Row(
//       children: [
//         Expanded(
//           flex: 2,
//           child: Padding(
//             padding: EdgeInsets.all(8.0),
//             child: Column(
//               crossAxisAlignment: CrossAxisAlignment.center,
//               children: [
//                 Text(
//                   'القطرية', // Airport Name
//                   style: TextStyle(
//                     fontFamily: 'Tajawal',
//                     color: MainColors.mainColor1,
//                     fontSize: 18.0.sp,
//                     fontWeight: FontWeight.bold,
//                   ),
//                 ),
//                 SizedBox(height: 5.h),
//                 Text(
//                   'الموقع: شرق قطر', // Location: Airport Location
//                   style: TextStyle(
//                     fontFamily: 'Tajawal',
//                     color: MainColors.mainColor4,
//                     fontSize: 14.0.sp,
//                     fontWeight: FontWeight.bold,
//                   ),
//                 ),
//                 SizedBox(height: 5.h),
//                 Text(
//                   'المحطة:الخطوط الجويةالقطرية', // Terminal: Terminal Name
//                   style: TextStyle(
//                     fontFamily: 'Tajawal',
//                     color: MainColors.mainColor4,
//                     fontSize: 14.0.sp,
//                     fontWeight: FontWeight.bold,
//                   ),
//                 ),
//                 SizedBox(height: 5.h),
//                 Text(
//                   'البوابات: 06', // Gates: Gate Numbers
//                   style: TextStyle(
//                     fontFamily: 'Tajawal',
//                     color: MainColors.mainColor4,
//                     fontSize: 14.0.sp,
//                     fontWeight: FontWeight.bold,
//                   ),
//                 ),
//               ],
//             ),
//           ),
//         ),
//         Expanded(
//           flex: 1,
//           child: Container(
//             width: 180.w, // Set width for the image container
//             height: 110.h,
//             decoration: BoxDecoration(
//               borderRadius: BorderRadius.only(
//                 topLeft: Radius.circular(0.0),
//                 bottomLeft: Radius.circular(0.0),
//                 topRight: Radius.circular(15.0),
//                 bottomRight: Radius.circular(15.0),
//               ),
//               image: DecorationImage(
//                 fit: BoxFit.cover,
//                 image: AssetImage(
//                   "assets/images/qatar.jpg",
//                 ),
//               ),
//             ),
//           ),
//         ),
//       ],
//     ),
//   ),
// ),
//
// TextButton(
//   onPressed: () {
//     Get.to(() =>  booking()); // Add your button press logic here
//   },
//   child: Card(
//     color: Colors.white, // Set background color to white
//     shape: RoundedRectangleBorder(
//       borderRadius: BorderRadius.circular(15.0),
//     ),
//     elevation: 0.8, // Add elevation for a shadow effect
//     child: Row(
//       children: [
//         Expanded(
//           flex: 2,
//           child: Padding(
//             padding: EdgeInsets.all(8.0),
//             child: Column(
//               crossAxisAlignment: CrossAxisAlignment.center,
//               children: [
//                 Text(
//                   ' الامارتية', // Airport Name
//                   style: TextStyle(
//                     fontFamily: 'Tajawal',
//                     color: MainColors.mainColor1,
//                     fontSize: 18.0.sp,
//                     fontWeight: FontWeight.bold,
//                   ),
//                 ),
//                 SizedBox(height: 5.h),
//                 Text(
//                   'الموقع: الإمارات العربية المتحدة', // Location: Airport Location
//                   style: TextStyle(
//                     fontFamily: 'Tajawal',
//                     color: MainColors.mainColor4,
//                     fontSize: 14.0.sp,
//                     fontWeight: FontWeight.bold,
//                   ),
//                 ),
//                 SizedBox(height: 5.h),
//                 Text(
//                   'المحطة:الخطوط الجوية الامارتية', // Terminal: Terminal Name
//                   style: TextStyle(
//                     fontFamily: 'Tajawal',
//                     color: MainColors.mainColor4,
//                     fontSize: 14.0.sp,
//                     fontWeight: FontWeight.bold,
//                   ),
//                 ),
//                 SizedBox(height: 5.h),
//                 Text(
//                   'البوابات: 08', // Gates: Gate Numbers
//                   style: TextStyle(
//                     fontFamily: 'Tajawal',
//                     color: MainColors.mainColor4,
//                     fontSize: 14.0.sp,
//                     fontWeight: FontWeight.bold,
//                   ),
//                 ),
//               ],
//             ),
//           ),
//         ),
//         Expanded(
//           flex: 1,
//           child: Container(
//             width: 150.w, // Set width for the image container
//             height: 110.h,
//             decoration: BoxDecoration(
//               borderRadius: BorderRadius.only(
//                 topLeft: Radius.circular(0.0),
//                 bottomLeft: Radius.circular(0.0),
//                 topRight: Radius.circular(15.0),
//                 bottomRight: Radius.circular(15.0),
//               ),
//               image: DecorationImage(
//                 fit: BoxFit.cover,
//                 image: AssetImage(
//                   "assets/images/emarat.gif",
//                 ),
//               ),
//             ),
//           ),
//         ),
//       ],
//     ),
//   ),
// ),
//
// TextButton(
//   onPressed: () {
//     Get.to(() =>  booking()); // Add your button press logic here
//   },
//   child: Card(
//     color: Colors.white, // Set background color to white
//     shape: RoundedRectangleBorder(
//       borderRadius: BorderRadius.circular(15.0),
//     ),
//     elevation: 0.8, // Add elevation for a shadow effect
//     child: Row(
//       children: [
//         Expanded(
//           flex: 2,
//           child: Padding(
//             padding: EdgeInsets.all(8.0),
//             child: Column(
//               crossAxisAlignment: CrossAxisAlignment.center,
//               children: [
//                 Text(
//                   'التركية', // Airport Name
//                   style: TextStyle(
//                     fontFamily: 'Tajawal',
//                     color: MainColors.mainColor1,
//                     fontSize: 18.0.sp,
//                     fontWeight: FontWeight.bold,
//                   ),
//                 ),
//                 SizedBox(height: 5.h),
//                 Text(
//                   'الموقع: شمال تركيا', // Location: Airport Location
//                   style: TextStyle(
//                     fontFamily: 'Tajawal',
//                     color: MainColors.mainColor4,
//                     fontSize: 14.0.sp,
//                     fontWeight: FontWeight.bold,
//                   ),
//                 ),
//                 SizedBox(height: 5.h),
//                 Text(
//                   'المحطة:الخطوط الجوية التركية', // Terminal: Terminal Name
//                   style: TextStyle(
//                     fontFamily: 'Tajawal',
//                     color: MainColors.mainColor4,
//                     fontSize: 14.0.sp,
//                     fontWeight: FontWeight.bold,
//                   ),
//                 ),
//                 SizedBox(height: 5.h),
//                 Text(
//                   'البوابات:04', // Gates: Gate Numbers
//                   style: TextStyle(
//                     fontFamily: 'Tajawal',
//                     color: MainColors.mainColor4,
//                     fontSize: 14.0.sp,
//                     fontWeight: FontWeight.bold,
//                   ),
//                 ),
//               ],
//             ),
//           ),
//         ),
//         Expanded(
//           flex: 1,
//           child: Container(
//             width: 150.w, // Set width for the image container
//             height: 110.h,
//             decoration: BoxDecoration(
//               borderRadius: BorderRadius.only(
//                 topLeft: Radius.circular(0.0),
//                 bottomLeft: Radius.circular(0.0),
//                 topRight: Radius.circular(15.0),
//                 bottomRight: Radius.circular(15.0),
//               ),
//               image: DecorationImage(
//                 fit: BoxFit.cover,
//                 image: AssetImage(
//                   "assets/images/turkish.jpg",
//                 ),
//               ),
//             ),
//           ),
//         ),
//       ],
//     ),
//   ),
// ),
//
// TextButton(
//   onPressed: () {
//     Get.to(() =>  booking()); // Add your button press logic here
//   },
//   child: Card(
//     color: Colors.white, // Set background color to white
//     shape: RoundedRectangleBorder(
//       borderRadius: BorderRadius.circular(15.0),
//     ),
//     elevation: 0.8, // Add elevation for a shadow effect
//     child: Row(
//       children: [
//         Expanded(
//           flex: 2,
//           child: Padding(
//             padding: EdgeInsets.all(8.0),
//             child: Column(
//               crossAxisAlignment: CrossAxisAlignment.center,
//               children: [
//                 Text(
//                   'القطرية', // Airport Name
//                   style: TextStyle(
//                     fontFamily: 'Tajawal',
//                     color: MainColors.mainColor1,
//                     fontSize: 18.0.sp,
//                     fontWeight: FontWeight.bold,
//                   ),
//                 ),
//                 SizedBox(height: 5.h),
//                 Text(
//                   'الموقع: شرق قطر', // Location: Airport Location
//                   style: TextStyle(
//                     fontFamily: 'Tajawal',
//                     color: MainColors.mainColor4,
//                     fontSize: 14.0.sp,
//                     fontWeight: FontWeight.bold,
//                   ),
//                 ),
//                 SizedBox(height: 5.h),
//                 Text(
//                   'المحطة:الخطوط الجويةالقطرية', // Terminal: Terminal Name
//                   style: TextStyle(
//                     fontFamily: 'Tajawal',
//                     color: MainColors.mainColor4,
//                     fontSize: 14.0.sp,
//                     fontWeight: FontWeight.bold,
//                   ),
//                 ),
//                 SizedBox(height: 5.h),
//                 Text(
//                   'البوابات: 06', // Gates: Gate Numbers
//                   style: TextStyle(
//                     fontFamily: 'Tajawal',
//                     color: MainColors.mainColor4,
//                     fontSize: 14.0.sp,
//                     fontWeight: FontWeight.bold,
//                   ),
//                 ),
//               ],
//             ),
//           ),
//         ),
//         Expanded(
//           flex: 1,
//           child: Container(
//             width: 180.w, // Set width for the image container
//             height: 110.h,
//             decoration: BoxDecoration(
//               borderRadius: BorderRadius.only(
//                 topLeft: Radius.circular(0.0),
//                 bottomLeft: Radius.circular(0.0),
//                 topRight: Radius.circular(15.0),
//                 bottomRight: Radius.circular(15.0),
//               ),
//               image: DecorationImage(
//                 fit: BoxFit.cover,
//                 image: AssetImage(
//                   "assets/images/qatar.jpg",
//                 ),
//               ),
//             ),
//           ),
//         ),
//       ],
//     ),
//   ),
// ),
// TextButton(
//   onPressed: () {
//     Get.to(() =>  booking()); // Add your button press logic here
//   },
//   child: Card(
//     color: Colors.white, // Set background color to white
//     shape: RoundedRectangleBorder(
//       borderRadius: BorderRadius.circular(15.0),
//     ),
//     elevation: 0.8, // Add elevation for a shadow effect
//     child: Row(
//       children: [
//         Expanded(
//           flex: 2,
//           child: Padding(
//             padding: EdgeInsets.all(8.0),
//             child: Column(
//               crossAxisAlignment: CrossAxisAlignment.center,
//               children: [
//                 Text(
//                   ' الامارتية', // Airport Name
//                   style: TextStyle(
//                     fontFamily: 'Tajawal',
//                     color: MainColors.mainColor1,
//                     fontSize: 18.0.sp,
//                     fontWeight: FontWeight.bold,
//                   ),
//                 ),
//                 SizedBox(height: 5.h),
//                 Text(
//                   'الموقع: الإمارات العربية المتحدة', // Location: Airport Location
//                   style: TextStyle(
//                     fontFamily: 'Tajawal',
//                     color: MainColors.mainColor4,
//                     fontSize: 14.0.sp,
//                     fontWeight: FontWeight.bold,
//                   ),
//                 ),
//                 SizedBox(height: 5.h),
//                 Text(
//                   'المحطة:الخطوط الجوية الامارتية', // Terminal: Terminal Name
//                   style: TextStyle(
//                     fontFamily: 'Tajawal',
//                     color: MainColors.mainColor4,
//                     fontSize: 14.0.sp,
//                     fontWeight: FontWeight.bold,
//                   ),
//                 ),
//                 SizedBox(height: 5.h),
//                 Text(
//                   'البوابات: 08', // Gates: Gate Numbers
//                   style: TextStyle(
//                     fontFamily: 'Tajawal',
//                     color: MainColors.mainColor4,
//                     fontSize: 14.0.sp,
//                     fontWeight: FontWeight.bold,
//                   ),
//                 ),
//               ],
//             ),
//           ),
//         ),
//         Expanded(
//           flex: 1,
//           child: Container(
//             width: 150.w, // Set width for the image container
//             height: 110.h,
//             decoration: BoxDecoration(
//               borderRadius: BorderRadius.only(
//                 topLeft: Radius.circular(0.0),
//                 bottomLeft: Radius.circular(0.0),
//                 topRight: Radius.circular(15.0),
//                 bottomRight: Radius.circular(15.0),
//               ),
//               image: DecorationImage(
//                 fit: BoxFit.cover,
//                 image: AssetImage(
//                   "assets/images/emarat.gif",
//                 ),
//               ),
//             ),
//           ),
//         ),
//       ],
//     ),
//   ),
// ),
//
// TextButton(
//   onPressed: () {
//     Get.to(() =>  booking()); // Add your button press logic here
//   },
//   child: Card(
//     color: Colors.white, // Set background color to white
//     shape: RoundedRectangleBorder(
//       borderRadius: BorderRadius.circular(15.0),
//     ),
//     elevation: 0.8, // Add elevation for a shadow effect
//     child: Row(
//       children: [
//         Expanded(
//           flex: 2,
//           child: Padding(
//             padding: EdgeInsets.all(8.0),
//             child: Column(
//               crossAxisAlignment: CrossAxisAlignment.center,
//               children: [
//                 Text(
//                   'التركية', // Airport Name
//                   style: TextStyle(
//                     fontFamily: 'Tajawal',
//                     color: MainColors.mainColor1,
//                     fontSize: 18.0.sp,
//                     fontWeight: FontWeight.bold,
//                   ),
//                 ),
//                 SizedBox(height: 5.h),
//                 Text(
//                   'الموقع: شمال تركيا', // Location: Airport Location
//                   style: TextStyle(
//                     fontFamily: 'Tajawal',
//                     color: MainColors.mainColor4,
//                     fontSize: 14.0.sp,
//                     fontWeight: FontWeight.bold,
//                   ),
//                 ),
//                 SizedBox(height: 5.h),
//                 Text(
//                   'المحطة:الخطوط الجوية التركية', // Terminal: Terminal Name
//                   style: TextStyle(
//                     fontFamily: 'Tajawal',
//                     color: MainColors.mainColor4,
//                     fontSize: 14.0.sp,
//                     fontWeight: FontWeight.bold,
//                   ),
//                 ),
//                 SizedBox(height: 5.h),
//                 Text(
//                   'البوابات:04', // Gates: Gate Numbers
//                   style: TextStyle(
//                     fontFamily: 'Tajawal',
//                     color: MainColors.mainColor4,
//                     fontSize: 14.0.sp,
//                     fontWeight: FontWeight.bold,
//                   ),
//                 ),
//               ],
//             ),
//           ),
//         ),
//         Expanded(
//           flex: 1,
//           child: Container(
//             width: 150.w, // Set width for the image container
//             height: 110.h,
//             decoration: BoxDecoration(
//               borderRadius: BorderRadius.only(
//                 topLeft: Radius.circular(0.0),
//                 bottomLeft: Radius.circular(0.0),
//                 topRight: Radius.circular(15.0),
//                 bottomRight: Radius.circular(15.0),
//               ),
//               image: DecorationImage(
//                 fit: BoxFit.cover,
//                 image: AssetImage(
//                   "assets/images/turkish.jpg",
//                 ),
//               ),
//             ),
//           ),
//         ),
//       ],
//     ),
//   ),
// ),
//
// TextButton(
//   onPressed: () {
//     Get.to(() =>  booking()); // Add your button press logic here
//   },
//   child: Card(
//     color: Colors.white, // Set background color to white
//     shape: RoundedRectangleBorder(
//       borderRadius: BorderRadius.circular(15.0),
//     ),
//     elevation: 0.8, // Add elevation for a shadow effect
//     child: Row(
//       children: [
//         Expanded(
//           flex: 2,
//           child: Padding(
//             padding: EdgeInsets.all(8.0),
//             child: Column(
//               crossAxisAlignment: CrossAxisAlignment.center,
//               children: [
//                 Text(
//                   'القطرية', // Airport Name
//                   style: TextStyle(
//                     fontFamily: 'Tajawal',
//                     color: MainColors.mainColor1,
//                     fontSize: 18.0.sp,
//                     fontWeight: FontWeight.bold,
//                   ),
//                 ),
//                 SizedBox(height: 5.h),
//                 Text(
//                   'الموقع: شرق قطر', // Location: Airport Location
//                   style: TextStyle(
//                     fontFamily: 'Tajawal',
//                     color: MainColors.mainColor4,
//                     fontSize: 14.0.sp,
//                     fontWeight: FontWeight.bold,
//                   ),
//                 ),
//                 SizedBox(height: 5.h),
//                 Text(
//                   'المحطة:الخطوط الجويةالقطرية', // Terminal: Terminal Name
//                   style: TextStyle(
//                     fontFamily: 'Tajawal',
//                     color: MainColors.mainColor4,
//                     fontSize: 14.0.sp,
//                     fontWeight: FontWeight.bold,
//                   ),
//                 ),
//                 SizedBox(height: 5.h),
//                 Text(
//                   'البوابات: 06', // Gates: Gate Numbers
//                   style: TextStyle(
//                     fontFamily: 'Tajawal',
//                     color: MainColors.mainColor4,
//                     fontSize: 14.0.sp,
//                     fontWeight: FontWeight.bold,
//                   ),
//                 ),
//               ],
//             ),
//           ),
//         ),
//         Expanded(
//           flex: 1,
//           child: Container(
//             width: 180.w, // Set width for the image container
//             height: 110.h,
//             decoration: BoxDecoration(
//               borderRadius: BorderRadius.only(
//                 topLeft: Radius.circular(0.0),
//                 bottomLeft: Radius.circular(0.0),
//                 topRight: Radius.circular(15.0),
//                 bottomRight: Radius.circular(15.0),
//               ),
//               image: DecorationImage(
//                 fit: BoxFit.cover,
//                 image: AssetImage(
//                   "assets/images/qatar.jpg",
//                 ),
//               ),
//             ),
//           ),
//         ),
//       ],
//     ),
//   ),
// ),     TextButton(
//   onPressed: () {
//     Get.to(() =>  booking()); // Add your button press logic here
//   },
//   child: Card(
//     color: Colors.white, // Set background color to white
//     shape: RoundedRectangleBorder(
//       borderRadius: BorderRadius.circular(15.0),
//     ),
//     elevation: 0.8, // Add elevation for a shadow effect
//     child: Row(
//       children: [
//         Expanded(
//           flex: 2,
//           child: Padding(
//             padding: EdgeInsets.all(8.0),
//             child: Column(
//               crossAxisAlignment: CrossAxisAlignment.center,
//               children: [
//                 Text(
//                   ' الامارتية', // Airport Name
//                   style: TextStyle(
//                     fontFamily: 'Tajawal',
//                     color: MainColors.mainColor1,
//                     fontSize: 18.0.sp,
//                     fontWeight: FontWeight.bold,
//                   ),
//                 ),
//                 SizedBox(height: 5.h),
//                 Text(
//                   'الموقع: الإمارات العربية المتحدة', // Location: Airport Location
//                   style: TextStyle(
//                     fontFamily: 'Tajawal',
//                     color: MainColors.mainColor4,
//                     fontSize: 14.0.sp,
//                     fontWeight: FontWeight.bold,
//                   ),
//                 ),
//                 SizedBox(height: 5.h),
//                 Text(
//                   'المحطة:الخطوط الجوية الامارتية', // Terminal: Terminal Name
//                   style: TextStyle(
//                     fontFamily: 'Tajawal',
//                     color: MainColors.mainColor4,
//                     fontSize: 14.0.sp,
//                     fontWeight: FontWeight.bold,
//                   ),
//                 ),
//                 SizedBox(height: 5.h),
//                 Text(
//                   'البوابات: 08', // Gates: Gate Numbers
//                   style: TextStyle(
//                     fontFamily: 'Tajawal',
//                     color: MainColors.mainColor4,
//                     fontSize: 14.0.sp,
//                     fontWeight: FontWeight.bold,
//                   ),
//                 ),
//               ],
//             ),
//           ),
//         ),
//         Expanded(
//           flex: 1,
//           child: Container(
//             width: 150.w, // Set width for the image container
//             height: 110.h,
//             decoration: BoxDecoration(
//               borderRadius: BorderRadius.only(
//                 topLeft: Radius.circular(0.0),
//                 bottomLeft: Radius.circular(0.0),
//                 topRight: Radius.circular(15.0),
//                 bottomRight: Radius.circular(15.0),
//               ),
//               image: DecorationImage(
//                 fit: BoxFit.cover,
//                 image: AssetImage(
//                   "assets/images/emarat.gif",
//                 ),
//               ),
//             ),
//           ),
//         ),
//       ],
//     ),
//   ),
// ),
//
// TextButton(
//   onPressed: () {
//     Get.to(() =>  booking()); // Add your button press logic here
//   },
//   child: Card(
//     color: Colors.white, // Set background color to white
//     shape: RoundedRectangleBorder(
//       borderRadius: BorderRadius.circular(15.0),
//     ),
//     elevation: 0.8, // Add elevation for a shadow effect
//     child: Row(
//       children: [
//         Expanded(
//           flex: 2,
//           child: Padding(
//             padding: EdgeInsets.all(8.0),
//             child: Column(
//               crossAxisAlignment: CrossAxisAlignment.center,
//               children: [
//                 Text(
//                   'التركية', // Airport Name
//                   style: TextStyle(
//                     fontFamily: 'Tajawal',
//                     color: MainColors.mainColor1,
//                     fontSize: 18.0.sp,
//                     fontWeight: FontWeight.bold,
//                   ),
//                 ),
//                 SizedBox(height: 5.h),
//                 Text(
//                   'الموقع: شمال تركيا', // Location: Airport Location
//                   style: TextStyle(
//                     fontFamily: 'Tajawal',
//                     color: MainColors.mainColor4,
//                     fontSize: 14.0.sp,
//                     fontWeight: FontWeight.bold,
//                   ),
//                 ),
//                 SizedBox(height: 5.h),
//                 Text(
//                   'المحطة:الخطوط الجوية التركية', // Terminal: Terminal Name
//                   style: TextStyle(
//                     fontFamily: 'Tajawal',
//                     color: MainColors.mainColor4,
//                     fontSize: 14.0.sp,
//                     fontWeight: FontWeight.bold,
//                   ),
//                 ),
//                 SizedBox(height: 5.h),
//                 Text(
//                   'البوابات:04', // Gates: Gate Numbers
//                   style: TextStyle(
//                     fontFamily: 'Tajawal',
//                     color: MainColors.mainColor4,
//                     fontSize: 14.0.sp,
//                     fontWeight: FontWeight.bold,
//                   ),
//                 ),
//               ],
//             ),
//           ),
//         ),
//         Expanded(
//           flex: 1,
//           child: Container(
//             width: 150.w, // Set width for the image container
//             height: 110.h,
//             decoration: BoxDecoration(
//               borderRadius: BorderRadius.only(
//                 topLeft: Radius.circular(0.0),
//                 bottomLeft: Radius.circular(0.0),
//                 topRight: Radius.circular(15.0),
//                 bottomRight: Radius.circular(15.0),
//               ),
//               image: DecorationImage(
//                 fit: BoxFit.cover,
//                 image: AssetImage(
//                   "assets/images/turkish.jpg",
//                 ),
//               ),
//             ),
//           ),
//         ),
//       ],
//     ),
//   ),
// ),
//
// TextButton(
//   onPressed: () {
//     Get.to(() =>  booking()); // Add your button press logic here
//   },
//   child: Card(
//     color: Colors.white, // Set background color to white
//     shape: RoundedRectangleBorder(
//       borderRadius: BorderRadius.circular(15.0),
//     ),
//     elevation: 0.8, // Add elevation for a shadow effect
//     child: Row(
//       children: [
//         Expanded(
//           flex: 2,
//           child: Padding(
//             padding: EdgeInsets.all(8.0),
//             child: Column(
//               crossAxisAlignment: CrossAxisAlignment.center,
//               children: [
//                 Text(
//                   'القطرية', // Airport Name
//                   style: TextStyle(
//                     fontFamily: 'Tajawal',
//                     color: MainColors.mainColor1,
//                     fontSize: 18.0.sp,
//                     fontWeight: FontWeight.bold,
//                   ),
//                 ),
//                 SizedBox(height: 5.h),
//                 Text(
//                   'الموقع: شرق قطر', // Location: Airport Location
//                   style: TextStyle(
//                     fontFamily: 'Tajawal',
//                     color: MainColors.mainColor4,
//                     fontSize: 14.0.sp,
//                     fontWeight: FontWeight.bold,
//                   ),
//                 ),
//                 SizedBox(height: 5.h),
//                 Text(
//                   'المحطة:الخطوط الجويةالقطرية', // Terminal: Terminal Name
//                   style: TextStyle(
//                     fontFamily: 'Tajawal',
//                     color: MainColors.mainColor4,
//                     fontSize: 14.0.sp,
//                     fontWeight: FontWeight.bold,
//                   ),
//                 ),
//                 SizedBox(height: 5.h),
//                 Text(
//                   'البوابات: 06', // Gates: Gate Numbers
//                   style: TextStyle(
//                     fontFamily: 'Tajawal',
//                     color: MainColors.mainColor4,
//                     fontSize: 14.0.sp,
//                     fontWeight: FontWeight.bold,
//                   ),
//                 ),
//               ],
//             ),
//           ),
//         ),
//         Expanded(
//           flex: 1,
//           child: Container(
//             width: 180.w, // Set width for the image container
//             height: 110.h,
//             decoration: BoxDecoration(
//               borderRadius: BorderRadius.only(
//                 topLeft: Radius.circular(0.0),
//                 bottomLeft: Radius.circular(0.0),
//                 topRight: Radius.circular(15.0),
//                 bottomRight: Radius.circular(15.0),
//               ),
//               image: DecorationImage(
//                 fit: BoxFit.cover,
//                 image: AssetImage(
//                   "assets/images/qatar.jpg",
//                 ),
//               ),
//             ),
//           ),
//         ),
//       ],
//     ),
//   ),
// ),