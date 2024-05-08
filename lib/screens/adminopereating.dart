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

class adminoperation extends StatefulWidget {
  final int? airportId;
  const adminoperation({Key? key,this.airportId}) : super(key: key);



  @override
  _adminoperationState createState() => _adminoperationState();
}

class _adminoperationState extends State<adminoperation> {
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
                  'إدارة المطارات',
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
          BouncingButton(
            onPressed: () {
              Get.to(() => addadmin());
            },
            onPress: () {
              Get.to(() => addadmin());
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
                    "إضافة مطار",
                    style: TextStyle(
                      fontFamily: 'Tajawal',
                      color: Colors.white,
                    ),
                  ),

                  IconButton(
                    style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.all<Color>(
                          MainColors.mainColor7),
                      shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                        RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8.0),
                        ),
                      ),
                    ),
                    splashRadius: 22,
                    splashColor: MainColors.mainColor6,
                    onPressed: () {
                      Get.to(() => addadmin());
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
                          SizedBox(height: 10.h),
                          TextButton(
                            onPressed: () {
                              Get.to(() => adminaddticket(airportId: airportData["id"]));
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
                                          Row(
                                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                            children: [

                                              IconButton(
                                                icon: Icon(Icons.delete, color: Colors.red,),
                                                onPressed: () async {

                                                    print("deleting");
                                                    await Crud().deleteoneairport(airportData["id"].toString());


                                                },
                                              ),
                                            ],
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
