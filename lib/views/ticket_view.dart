
import 'package:commerce/colors.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:get/get.dart';

import '../buttons/btn.dart';
import '../textstyle.dart';
import '../utils/app_layout.dart';
import '../widgets/column_layout.dart';
import '../widgets/layout_builder_widget.dart';
import '../widgets/thick_container.dart';

class TicketView extends StatelessWidget {
  final Map<String, dynamic> ticket;
  final bool? isColor;
  const TicketView({
    Key? key,
    required this.ticket,
    this.isColor,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = AppLayout.getSize(context);
    return SizedBox(
      width: size.width * 0.85,
      height: AppLayout.getHeight(GetPlatform.isAndroid == true ? 167 : 169),
      child: Container(

        margin: EdgeInsets.only(right: AppLayout.getHeight(16)),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [

            // First Container (Blue Part of the Ticket)
            Container(
              decoration: BoxDecoration(
                color: isColor == null ? MainColors.mainColor2 : MainColors.mainColor2,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(AppLayout.getHeight(21)),
                  topRight: Radius.circular(AppLayout.getHeight(21)),
                ),
              ),
              padding: const EdgeInsets.all(16),
              child: Column(
                children: [
                  // First Row
                  Row(
                    children: [
                      Text(
                        ticket['from']['code'],

                      ),
                      Expanded(child: Container()),
                      const ThickContainer(
                        isColor: true,
                      ),
                      Expanded(
                        child: Stack(children: [
                          SizedBox(
                            height: AppLayout.getHeight(24),
                            child: const LayoutBuilderWidget(sections: 6),
                          ),
                          Center(
                            child: Transform.rotate(
                              angle: 1.5,
                              child: Icon(
                                Icons.local_airport_rounded,
                                color: isColor == null
                                    ? Colors.white
                                    : const Color(0xFF8ACCF7),
                              ),
                            ),
                          ),
                        ]),
                      ),
                      const ThickContainer(
                        isColor: true,
                      ),
                      Expanded(child: Container()),
                      Text(
                        ticket['to']['code'],

                      ),
                    ],
                  ),



                  // Second Row
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      SizedBox(
                        width: AppLayout.getWidth(100),
                        child: Text(
                          ticket['from']['name'],
                         style: TextStyle(
                           color: Colors.white
                         ),
                        ),
                      ),
                      Text(
                        ticket['flying_time'],

                      ),
                      SizedBox(
                        width: AppLayout.getWidth(100),
                        child: Text(
                          ticket['to']['name'],
                          textAlign: TextAlign.end,
                          style: TextStyle(
                              color: Colors.white
                          ),
                        ),
                      )
                    ],
                  )
                ],
              ),
            ),

            // Second Container (Red Part of the Ticket)
            Container(

              child: Row(
                children: [
                  SizedBox(
                    height: AppLayout.getHeight(20),
                    width: AppLayout.getWidth(10),
                    child: DecoratedBox(
                      decoration: BoxDecoration(
                        color: isColor == null
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
                        builder:
                            (BuildContext context, BoxConstraints constraints) {
                          return Flex(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            mainAxisSize: MainAxisSize.max,
                            direction: Axis.horizontal,
                            children: List.generate(
                              (constraints.constrainWidth() / 15).floor(),
                              (index) => SizedBox(
                                width: 5,
                                height: 1,
                                child: DecoratedBox(
                                  decoration: BoxDecoration(
                                    color: isColor == null
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
                        color: isColor == null
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
                color: isColor == null
                    ? Colors.white
                    : Colors.white,
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(isColor == null ? 21 : 0),
                  bottomRight: Radius.circular(isColor == null ? 21 : 0),
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
                        firstText: ticket['date'],
                        secondText: "Date",
                        alignment: CrossAxisAlignment.start,
                        isColor: isColor,
                      ),
                      ColumnLayout(
                        firstText: ticket['departure_time'],
                        secondText: "Departure time",
                        alignment: CrossAxisAlignment.center,
                        isColor: isColor,
                      ),
                      ColumnLayout(
                        firstText: ticket['number'].toString(),
                        secondText: "Number",
                        alignment: CrossAxisAlignment.end,
                        isColor: isColor,
                      ),

                    ],
                  ),

                 ],
              ),
            ),
            SizedBox(height: 00,),

             ],
        ),
      ),
    );
  }
}



