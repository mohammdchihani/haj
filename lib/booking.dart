

import 'package:commerce/screens/addticket.dart';
import 'package:commerce/screens/adminopereating.dart';
import 'package:commerce/screens/confirm.dart';
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


class booking extends StatefulWidget {
  final Map<String, dynamic>? ticket;
  final bool? isColor;
  final int? airportId;
  const booking({
    Key? key,
    this.ticket,
    this.isColor,
    this.airportId,
  }) : super(key: key);

  @override
  _bookingState createState() => _bookingState();
}

class _bookingState extends State<booking> {
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
                ' حجز الرحلات',
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
              Get.to(() => booking());
            },
          ),
        ),
        body: Column(
          children: [
            SizedBox(height: 20.h),
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
                        return TextButton(
                          onPressed: () {
                            Get.to(() => confirm());                          },
                          child: Column(
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
                                              Text(' ${flights[index]["from"]}', style: TextStyle(
                                                fontFamily: 'Tajawal',
                                                fontWeight: FontWeight.bold,

                                              ),),
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
                                                style: TextStyle(
                                                  fontFamily: 'Tajawal',
                                                  fontWeight: FontWeight.bold,

                                                ),
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
                                                ' ${flights[index]["timeOfFlight"]}',style: TextStyle(
                                                fontFamily: 'Tajawal',
                                                fontWeight: FontWeight.bold,

                                              ),
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
                          ),
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



// import 'package:commerce/screens/confirm.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_screenutil/flutter_screenutil.dart';
// import 'package:get/get.dart';
// import 'package:get/get_core/src/get_main.dart';
// import '../colors.dart';
// import '../textstyle.dart';
// import '../utils/app_info_list.dart';
// import '../views/ticket_view.dart';
// import '../widgets/sub_title_widget.dart';
// import 'buttons/btn.dart';
//
//
// class booking extends StatelessWidget {
//   const booking({Key? key});
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
//           title: Text(
//             'حجز التذكرة',
//             style: TextStyle(
//               fontFamily: 'Tajawal',
//               color: MainColors.mainColor3,
//               fontWeight: FontWeight.bold,
//               fontSize: 22.0.sp,
//             ),
//           ),
//           iconTheme: IconThemeData(
//             color: Colors.white, // Set icon color to white
//           ),
//         ),
//
//         body: ListView(
//           padding: const EdgeInsets.symmetric(horizontal: 30),
//           children: [
//             Column(
//               children: [
//                 Row(
//                   mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                   children: [
//                     Container(
//                       height: 40,
//                       width: 30,
//                       decoration: BoxDecoration(
//                         borderRadius: BorderRadius.circular(10),
//                         image: DecorationImage(
//                           fit: BoxFit.fitHeight,
//                           image: AssetImage("assets/images/Cream and Green Simple Minimalist Islamic Travel Agency Logo.svg"),
//                         ),
//                       ),
//                     ),
//                   ],
//                 ),
//               ],
//             ),
//             SingleChildScrollView(
//               scrollDirection: Axis.horizontal,
//               child: Column(
//                 children: [
//               // Adjust the height as per your requirement
//                   Column(
//                     mainAxisAlignment: MainAxisAlignment.center,
//                     children: ticketList.map((ticket) {
//                       return Column(
//                         children: [
//                           TextButton(
//
//                             onPressed: () {   Get.to(() =>  confirm()); },
//                             child: TicketView(
//                               ticket: ticket,
//                             ),
//                           ),
//                           SizedBox(height: 20), // Adjust the height as per your requirement
//                         ],
//                       );
//                     }).toList(),
//                   ),
//                 ],
//               ),
//             )
//
//
//
//
//           ]),
//       ),
//     );
//   }
// }
