

import 'package:commerce/screens/adminopereating.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

import '../Crud.dart';
import '../colors.dart';
import '../endpoint.dart';
import '../utils/app_layout.dart';
import '../widgets/column_layout.dart';
import '../widgets/layout_builder_widget.dart';
import '../widgets/sub_title_widget.dart';
import '../widgets/thick_container.dart';
import 'addadmin.dart';
import 'addticket.dart';

class adminaddticket extends StatefulWidget {
  final Map<String, dynamic>? ticket;
  final bool? isColor;
  final int? airportId;
  const adminaddticket({
    Key? key,
    this.ticket,
    this.isColor,
    this.airportId,
  }) : super(key: key);

  @override
  _adminaddticketState createState() => _adminaddticketState();
}

class _adminaddticketState extends State<adminaddticket> {
  final Crud _crud = Crud();
  late List data = [];

  Future<List> fetchAirports() async {
    try {
      List response = await _crud.getRequest("${APIEndpoints.flight}/${widget.airportId}");
      if (response.isNotEmpty) {
        return response;
      } else {
        print('Fetching airports failed');
        return [];
      }
    } catch (e) {
      print('Error fetching airports: $e');
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
                'إدارة حجز الرحلات',
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
              Get.to(() => adminoperation());
            },
          ),
        ),
        body: Column(
          children: [
            SizedBox(height: 20.h),
            BouncingButton(
              onPressed: () {
                Get.to(() => addticket(airportId: widget.airportId));
              },
              onPress: () {
                Get.to(() => addticket(airportId: widget.airportId));
              },
              child: Container(
                width: 140.w,
                height: 49.h,
                alignment: Alignment.center,
                decoration: BoxDecoration(
                  color: MainColors.mainColor7,
                  borderRadius: BorderRadius.all(
                    Radius.circular(15),
                  ),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Spacer(),
                    Text(
                      "إضافة رحلة",
                      style: TextStyle(
                        fontFamily: 'Tajawal',
                        color: Colors.white,
                      ),
                    ),
                    IconButton(
                      onPressed: () {
                        Get.to(() => addticket(airportId: widget.airportId));
                      },
                      icon: Icon(
                        Icons.add,
                        size: 22.r,
                        color: MainColors.mainColor3,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Expanded(
              child: FutureBuilder<List>(
                future: fetchAirports(),
                builder: (BuildContext context, AsyncSnapshot<List> snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return Center(
                      child: CircularProgressIndicator(),
                    );
                  } else if (snapshot.hasError) {
                    return Center(
                      child: Text('Error: ${snapshot.error}'),
                    );
                  } else {
                    List flights = snapshot.data!;
                    return ListView.builder(
                      itemCount: flights.length,
                      itemBuilder: (context, index) {
                        return Column(
                          children: [
                            SizedBox(height: 25.h,),
                            Container(
                              child: Column(
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  Container(
                                    decoration: BoxDecoration(
                                      color: widget.isColor == null
                                          ? MainColors.mainColor2
                                          : MainColors.mainColor2,
                                      borderRadius: BorderRadius.only(
                                        topLeft: Radius.circular(AppLayout.getHeight(21)),
                                        topRight: Radius.circular(AppLayout.getHeight(21)),
                                      ),
                                    ),
                                    padding: const EdgeInsets.all(16),
                                    child: Column(
                                      children: [
                                        Row(
                                          children: [
                                            Text(' ${flights[index]["from"]}'),
                                            Expanded(child: Container()),
                                            const ThickContainer(
                                              isColor: true,
                                            ),
                                            Expanded(
                                              child: Stack(
                                                children: [
                                                  SizedBox(
                                                    height: AppLayout.getHeight(24),
                                                    child: const LayoutBuilderWidget(sections: 6),
                                                  ),
                                                  Center(
                                                    child: Transform.rotate(
                                                      angle: 1.5,
                                                      child: Icon(
                                                        Icons.local_airport_rounded,
                                                        color: widget.isColor == null
                                                            ? Colors.white
                                                            : const Color(0xFF8ACCF7),
                                                      ),
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ),
                                            const ThickContainer(
                                              isColor: true,
                                            ),
                                            Expanded(child: Container()),
                                            Text(
                                              ' ${flights[index]["to"]}',
                                            ),
                                          ],
                                        ),
                                        Row(
                                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                          children: [
                                            SizedBox(
                                              width: AppLayout.getWidth(100),
                                              child: Text(
                                                '',
                                                style: TextStyle(
                                                  color: Colors.white,
                                                ),
                                              ),
                                            ),
                                            Text(
                                              ' ${flights[index]["timeOfFlight"]}',
                                            ),
                                            SizedBox(
                                              width: AppLayout.getWidth(100),
                                              child: Text(
                                                '',
                                                textAlign: TextAlign.end,
                                                style: TextStyle(
                                                  color: Colors.white,
                                                ),
                                              ),
                                            )
                                          ],
                                        )

                                      ],
                                    ),
                                  ),
                                  Container(
                                    child: Row(
                                      children: [
                                        SizedBox(
                                          height: AppLayout.getHeight(20),
                                          width: AppLayout.getWidth(10),
                                          child: DecoratedBox(
                                            decoration: BoxDecoration(
                                              color: widget.isColor == null
                                                  ? Colors.black
                                                  : Colors.black,
                                              borderRadius: const BorderRadius.only(
                                                topRight: Radius.circular(10),
                                                bottomRight: Radius.circular(10),
                                              ),
                                            ),
                                          ),
                                        ),
                                        Expanded(
                                          child: Padding(
                                            padding: const EdgeInsets.all(12),
                                            child: LayoutBuilder(
                                              builder: (BuildContext context,
                                                  BoxConstraints constraints) {
                                                return Flex(
                                                  mainAxisAlignment:
                                                  MainAxisAlignment.spaceBetween,
                                                  mainAxisSize: MainAxisSize.max,
                                                  direction: Axis.horizontal,
                                                  children: List.generate(
                                                    (constraints.constrainWidth() / 15).floor(),
                                                        (index) => SizedBox(
                                                      width: 5,
                                                      height: 1,
                                                      child: DecoratedBox(
                                                        decoration: BoxDecoration(
                                                          color: widget.isColor == null
                                                              ? Colors.black
                                                              : Colors.black,
                                                        ),
                                                      ),
                                                    ),
                                                  ),
                                                );
                                              },
                                            ),
                                          ),
                                        ),
                                        SizedBox(
                                          height: 20,
                                          width: 10,
                                          child: DecoratedBox(
                                            decoration: BoxDecoration(
                                              color: widget.isColor == null
                                                  ? Colors.black
                                                  : Colors.black,
                                              borderRadius: const BorderRadius.only(
                                                topLeft: Radius.circular(10),
                                                bottomLeft: Radius.circular(10),
                                              ),
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                  // Third Container (Bottom Part of the Ticket)
                                  Container(
                                    decoration: BoxDecoration(
                                      color: widget.isColor == null
                                          ? Colors.white
                                          : Colors.white,
                                      borderRadius: BorderRadius.only(
                                        bottomLeft: Radius.circular(widget.isColor == null ? 21 : 0),
                                        bottomRight: Radius.circular(widget.isColor == null ? 21 : 0),
                                      ),
                                    ),
                                    padding: const EdgeInsets.only(
                                      left: 16,
                                      top: 10,
                                      right: 16,
                                      bottom: 16,
                                    ),
                                    child: Column(
                                      children: [
                                        Row(
                                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                          children: [
                                            ColumnLayout(
                                              firstText:  'تاريخ الإنطلاق',
                                              secondText: "${DateFormat('yyyy-MM-dd').format(DateTime.parse(flights[index]["startTime"]).add(Duration(hours: 1)))}",
                                              alignment: CrossAxisAlignment.start,
                                              isColor: widget.isColor,
                                            ),

                                            ColumnLayout(
                                              firstText:'رقم الرحلة',
                                              secondText: "${flights[index]["id"]}",
                                              alignment: CrossAxisAlignment.center,
                                              isColor: widget.isColor,
                                            ),
                                            ColumnLayout(
                                              firstText: 'تاريخ الوصول',
                                              secondText: "${DateFormat('yyyy-MM-dd').format(DateTime.parse(flights[index]["endTime"]).add(Duration(hours: 1)))}",
                                              alignment: CrossAxisAlignment.end,
                                              isColor: widget.isColor,
                                            ),
                                          ],
                                        ),
                                      ],
                                    ),
                                  ),
                                  SizedBox(height: 20,),
                                ],
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
        ),
      ),
    );
  }
}







// import 'package:commerce/screens/adminopereating.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_screenutil/flutter_screenutil.dart';
// import 'package:get/get.dart';
// import 'package:intl/intl.dart';
//
// import '../Crud.dart';
// import '../colors.dart';
// import '../endpoint.dart';
// import '../utils/app_layout.dart';
// import '../views/ticket_view.dart';
// import '../widgets/column_layout.dart';
// import '../widgets/layout_builder_widget.dart';
// import '../widgets/sub_title_widget.dart';
// import '../widgets/thick_container.dart';
// import 'addadmin.dart';
// import 'package:commerce/booking.dart';
//
// import 'addticket.dart';
//
// // Corrected the typo in the import statement
//
// class adminaddticket extends StatefulWidget {
//   final Map<String, dynamic>? ticket;
//   final bool? isColor;
//   final int? airportId;
//   const adminaddticket({
//     Key? key,
//     this.ticket,
//     this.isColor, this.airportId,
//   }) : super(key: key);
//
//   @override
//   _adminaddticketState createState() => _adminaddticketState();
// }
//
// class _adminaddticketState extends State<adminaddticket> {
//   final Crud _crud = Crud();
//   late List data = [];
//
//
//   Future<List> fetchAirportss() async {
//     try {
//       List response = await _crud.getRequest("${APIEndpoints.flight}/${widget.airportId}");
//       // Map n = response;
//       data = response;
//       print("dataaaaaaaaaaaaaa: ${data}");
//       if (!(response.isEmpty)) {
//         return data;
//       } else {
//         print('Fetching airports failed');
//         return [];
//       }
//     } catch (e) {
//       print('catch Error fetching airports: $e');
//
//       return [];
//     }
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return SafeArea(
//       child: Scaffold(
//         backgroundColor: MainColors.mainColor9,
//         appBar: AppBar(
//           backgroundColor: MainColors.mainColor1,
//           elevation: 0,
//           centerTitle: true,
//           title: Row(
//             mainAxisAlignment: MainAxisAlignment.center,
//             children: [
//               Text(
//                 'إدارة حجز الرحلات',
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
//             color: Colors.white,
//           ),
//           leading: IconButton(
//             icon: Icon(Icons.arrow_back),
//             onPressed: () {
//               Get.to(() => adminoperation());
//             },
//           ),
//         ),
//         body: FutureBuilder<List>(
//           future: fetchAirportss(),
//           builder: (BuildContext context, AsyncSnapshot<List> snapshot) {
//             if (snapshot.connectionState == ConnectionState.waiting) {
//               return Center(
//                 child: CircularProgressIndicator(), // Loading indicator while waiting for data
//               );
//             } else if (snapshot.hasError) {
//               return Center(
//                 child: Text('Error: ${snapshot.error}'), // Display error if fetching data failed
//               );
//             } else {
//               // Data has been successfully fetched
//               List flights = snapshot.data!;
//               print("dddddd ${flights}");
//               // Now you can use the data to build your UI
//               return Column(
//                 children: [
//                   SizedBox(height: 20.h),
//                   BouncingButton(
//                     onPressed: () {
//                       Get.to(() => addticket(airportId: widget.airportId));
//                     },
//                     onPress: () {
//                       Get.to(() => addticket(airportId: widget.airportId));
//                     },
//                     child: Container(
//                       width: 140.w,
//                       height: 49.h,
//                       alignment: Alignment.center,
//                       decoration: BoxDecoration(
//                         color: MainColors.mainColor7,
//                         borderRadius: BorderRadius.all(
//                           Radius.circular(15),
//                         ),
//                       ),
//                       child: Row(
//                         mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                         children: [
//                           Spacer(),
//                           Text(
//                             "إضافة رحلة",
//                             style: TextStyle(
//                               fontFamily: 'Tajawal',
//                               color: Colors.white,
//                             ),
//                           ),
//                           IconButton(
//                             style: ButtonStyle(
//                               backgroundColor: MaterialStateProperty.all<Color>(
//                                   MainColors.mainColor7),
//                               shape: MaterialStateProperty.all<RoundedRectangleBorder>(
//                                 RoundedRectangleBorder(
//                                   borderRadius: BorderRadius.circular(8.0),
//                                 ),
//                               ),
//                             ),
//                             splashRadius: 22,
//                             splashColor: MainColors.mainColor6,
//                             onPressed: () {
//                               Get.to(() => addticket(airportId: widget.airportId));
//                             },
//                             icon: Icon(
//                               Icons.add,
//                               size: 22.r,
//                               color: MainColors.mainColor3,
//                             ),
//                           ),
//                         ],
//                       ),
//                     ),
//                   ),
//                   SizedBox(height: 25.h,),
//                   Container(
//                     child: Column(
//                       mainAxisSize: MainAxisSize.min,
//                       children: [
//                         // Ticket information containers
//                         // First Container (Blue Part of the Ticket)
//                         Container(
//                           decoration: BoxDecoration(
//                             color: widget.isColor == null
//                                 ? MainColors.mainColor2
//                                 : MainColors.mainColor2,
//                             borderRadius: BorderRadius.only(
//                               topLeft: Radius.circular(AppLayout.getHeight(21)),
//                               topRight: Radius.circular(AppLayout.getHeight(21)),
//                             ),
//                           ),
//                           padding: const EdgeInsets.all(16),
//                           child: Column(
//                             children: [
//                               // First Row
//                               Row(
//                                 children: [
//                                   Text(' ${flights[0]["from"]}'),
//                                //   ${data[0]["to"]}
//
//                                   Expanded(child: Container()),
//                                   const ThickContainer(
//                                     isColor: true,
//                                   ),
//                                   Expanded(
//                                     child: Stack(
//                                       children: [
//                                         SizedBox(
//                                           height: AppLayout.getHeight(24),
//                                           child: const LayoutBuilderWidget(sections: 6),
//                                         ),
//                                         Center(
//                                           child: Transform.rotate(
//                                             angle: 1.5,
//                                             child: Icon(
//                                               Icons.local_airport_rounded,
//                                               color: widget.isColor == null
//                                                   ? Colors.white
//                                                   : const Color(0xFF8ACCF7),
//                                             ),
//                                           ),
//                                         ),
//                                       ],
//                                     ),
//                                   ),
//                                   const ThickContainer(
//                                     isColor: true,
//                                   ),
//                                   Expanded(child: Container()),
//                                   Text(
//                                    ' ${flights[0]["to"]}',
//                                   ),
//                                 ],
//                               ),
//                               // Second Row
//                               Row(
//                                 mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                                 children: [
//                                   SizedBox(
//                                     width: AppLayout.getWidth(100),
//                                     child: Text(
//                                       '',
//                                       style: TextStyle(
//                                         color: Colors.white,
//                                       ),
//                                     ),
//                                   ),
//                                   Text(
//                                   ' ${flights[0]["timeOfFlight"]}',
//                                   ),
//                                   SizedBox(
//                                     width: AppLayout.getWidth(100),
//                                     child: Text(
//                                       '',
//                                       textAlign: TextAlign.end,
//                                       style: TextStyle(
//                                         color: Colors.white,
//                                       ),
//                                     ),
//                                   )
//                                 ],
//                               )
//                             ],
//                           ),
//                         ),
//                         // Second Container (Red Part of the Ticket)
//                         Container(
//                           child: Row(
//                             children: [
//                               SizedBox(
//                                 height: AppLayout.getHeight(20),
//                                 width: AppLayout.getWidth(10),
//                                 child: DecoratedBox(
//                                   decoration: BoxDecoration(
//                                     color: widget.isColor == null
//                                         ? Colors.black
//                                         : Colors.black,
//                                     borderRadius: const BorderRadius.only(
//                                       topRight: Radius.circular(10),
//                                       bottomRight: Radius.circular(10),
//                                     ),
//                                   ),
//                                 ),
//                               ),
//                               Expanded(
//                                 child: Padding(
//                                   padding: const EdgeInsets.all(12),
//                                   child: LayoutBuilder(
//                                     builder: (BuildContext context,
//                                         BoxConstraints constraints) {
//                                       return Flex(
//                                         mainAxisAlignment:
//                                         MainAxisAlignment.spaceBetween,
//                                         mainAxisSize: MainAxisSize.max,
//                                         direction: Axis.horizontal,
//                                         children: List.generate(
//                                           (constraints.constrainWidth() / 15).floor(),
//                                               (index) => SizedBox(
//                                             width: 5,
//                                             height: 1,
//                                             child: DecoratedBox(
//                                               decoration: BoxDecoration(
//                                                 color: widget.isColor == null
//                                                     ? Colors.black
//                                                     : Colors.black,
//                                               ),
//                                             ),
//                                           ),
//                                         ),
//                                       );
//                                     },
//                                   ),
//                                 ),
//                               ),
//                               SizedBox(
//                                 height: 20,
//                                 width: 10,
//                                 child: DecoratedBox(
//                                   decoration: BoxDecoration(
//                                     color: widget.isColor == null
//                                         ? Colors.black
//                                         : Colors.black,
//                                     borderRadius: const BorderRadius.only(
//                                       topLeft: Radius.circular(10),
//                                       bottomLeft: Radius.circular(10),
//                                     ),
//                                   ),
//                                 ),
//                               ),
//                             ],
//                           ),
//                         ),
//                         // Third Container (Bottom Part of the Ticket)
//                         Container(
//                           decoration: BoxDecoration(
//                             color: widget.isColor == null
//                                 ? Colors.white
//                                 : Colors.white,
//                             borderRadius: BorderRadius.only(
//                               bottomLeft: Radius.circular(widget.isColor == null ? 21 : 0),
//                               bottomRight: Radius.circular(widget.isColor == null ? 21 : 0),
//                             ),
//                           ),
//                           padding: const EdgeInsets.only(
//                             left: 16,
//                             top: 10,
//                             right: 16,
//                             bottom: 16,
//                           ),
//                           child: Column(
//                             children: [
//                               Row(
//                                 mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                                 children: [
//                                   ColumnLayout(
//                                     firstText:  'تاريخ الإنطلاق',
//                                     secondText: "${DateFormat('yyyy-MM-dd').format(DateTime.parse(flights[0]["startTime"]).add(Duration(hours: 1)))}",
//                                     alignment: CrossAxisAlignment.start,
//                                     isColor: widget.isColor,
//                                   ),
//
//                                   ColumnLayout(
//                                     firstText:'رقم الرحلة',
//                                     secondText: "${flights[0]["id"]}",
//                                     alignment: CrossAxisAlignment.center,
//                                     isColor: widget.isColor,
//                                   ),
//                                   ColumnLayout(
//                                     firstText: 'تاريخ الوصول',
//                                     secondText: "${DateFormat('yyyy-MM-dd').format(DateTime.parse(flights[0]["endTime"]).add(Duration(hours: 1)))}",
//                                     alignment: CrossAxisAlignment.end,
//                                     isColor: widget.isColor,
//                                   ),
//                                 ],
//                               ),
//                             ],
//                           ),
//                         ),
//                         SizedBox(height: 20,),
//                       ],
//                     ),
//                   ),
//                 ],
//               );
//             }
//           },
//         ),
//       ),
//     );
//   }
// }

class BouncingButton extends StatefulWidget {
  final VoidCallback? onPressed;
  final Widget child;

  const BouncingButton({Key? key, this.onPressed, required this.child, required Null Function() onPress}) : super(key: key);

  @override
  _BouncingButtonState createState() => _BouncingButtonState();
}

class _BouncingButtonState extends State<BouncingButton> with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _animation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: Duration(milliseconds: 200),
    );
    _animation = CurveTween(curve: Curves.easeInOutBack)
        .animate(_controller)
      ..addListener(() {
        setState(() {});
      });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTapDown: _handleTapDown,
      onTapUp: _handleTapUp,
      onTapCancel: _handleTapCancel,
      child: Transform.scale(
        scale: 1 - _animation.value * 0.1,
        child: widget.child,
      ),
    );
  }

  void _handleTapDown(_) {
    _controller.forward();
  }

  void _handleTapUp(_) {
    _controller.reverse();
    widget.onPressed?.call();
  }

  void _handleTapCancel() {
    _controller.reverse();
  }
}
