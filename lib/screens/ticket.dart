import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../colors.dart';
import '../views/ticket2.dart';
import '../views/ticket_view.dart';
import '../widgets/sub_title_widget.dart';

class ticketScreen extends StatelessWidget {
  const ticketScreen({Key? key}) : super(key: key);

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
                ' التذكرة',
                style: TextStyle(
                  fontFamily: 'Tajawal',
                  color: MainColors.mainColor3,
                  fontWeight: FontWeight.bold,
                  fontSize: 22.0.sp,
                ),
              ),
              SizedBox(width: 8.w),
              Icon(
                Icons.airplane_ticket_outlined,
                color: Colors.white,
                size: 25.sp,
              ),
            ],
          ),
          iconTheme: IconThemeData(
            color: Colors.white,
          ),
        ),

        body: ListView(
          padding: EdgeInsets.symmetric(horizontal: 10.w),
          children: [

            SizedBox(height: 135.h),
            Container(
              padding: EdgeInsets.all(20.w),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(10.0),
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.5),
                    spreadRadius: 2,
                    blurRadius: 5,
                    offset: Offset(0, 3),
                  ),
                ],
              ),

              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  SizedBox(height: 10.h),

                  Text(
                    'مطار بارع ',
                    style: TextStyle(
                      fontFamily: 'Tajawal',
                      color: MainColors.mainColor1,
                      fontWeight: FontWeight.bold,
                      fontSize: 22.0.sp,
                    ),
                  ),
                  SizedBox(height: 20.h,),
                  SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: TicketView2(
                      ticket: {
                        'from': {'code': 'Maka', 'name': 'maka'},
                        'to': {'code': "Alg", 'name': "algeria"},
                        'flying_time': "1H 30M",
                        "date": '5 MAY',
                        'departure_time': '09: 00 AM',
                        'number': 60
                      },
                    ),
                  ),
                ],
              ),
            ),


          ],
        ),
      ),
    );
  }
}
