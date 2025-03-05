import 'package:barcode_widget/barcode_widget.dart';
import 'package:flutter/material.dart';
import 'package:movie_ticket/core/models/ticket_details_model.dart';
import 'package:movie_ticket/core/utils/screen_size.dart';

import '../../../core/common/widgets/app_button.dart';

class TicketWidget extends StatelessWidget {
  final TicketModel ticket;
  const TicketWidget({
    super.key,
    required this.ticket,
  });

  @override
  Widget build(BuildContext context) {
    final appHeight = context.appHeight;
    final appWidth = context.appWidth;
    return AppRectangularButton(
      height: appHeight * .52,
      width: appWidth * .7,
      borderRadius: 50,
      foregroundColor: LinearGradient(
        colors: [
          Color(0xFF4A238E),
          Color(0xFFA03DA0),
        ],
        stops: [0.09, 1.0],
      ),
      child: Stack(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(50),
            child: SizedBox(
              height: appHeight * .52,
              width: appWidth * .7,
              child: Image.network(
                ticket.picture,
                fit: BoxFit.cover,
              ),
            ),
          ),
          Positioned(
            top: appHeight * .34,
            right: 0,
            left: 0,
            // bottom: appHeight * .1,
            child: Container(
              height: appHeight * .18,
              width: appWidth * .7,
              padding: EdgeInsets.symmetric(
                horizontal: appWidth * .03,
                vertical: appHeight * .01,
              ),
              decoration: BoxDecoration(
                color: Colors.grey.withOpacity(.9),
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(50),
                  bottomRight: Radius.circular(50),
                ),
              ),
              child: Column(
                spacing: appHeight * .01,
                children: [
                  // Dotted line
                  DottedDivider(appWidth: appWidth),

                  //Date and Time Row
                  Row(
                    children: [
                      // Date
                      Expanded(
                        child: Row(
                          children: [
                            Text(
                              "Date: ",
                              style: TextStyle(
                                fontSize: appHeight * .02,
                                color: Colors.deepPurple,
                                fontWeight: FontWeight.w700,
                              ),
                            ),
                            Text(
                              ticket.date,
                              style: TextStyle(
                                fontSize: appHeight * .022,
                                color: Colors.black87,
                                fontWeight: FontWeight.w700,
                              ),
                            ),
                          ],
                        ),
                      ),

                      SizedBox(width: appWidth * .03),

                      //Time
                      Expanded(
                        child: Row(
                          children: [
                            Text(
                              "Time: ",
                              style: TextStyle(
                                fontSize: appHeight * .02,
                                color: Colors.deepPurple,
                                fontWeight: FontWeight.w700,
                              ),
                            ),
                            Text(
                              ticket.time,
                              style: TextStyle(
                                fontSize: appHeight * .022,
                                color: Colors.black87,
                                fontWeight: FontWeight.w700,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),

                  // Row and Seats Row
                  Row(
                    children: [
                      // Date
                      Expanded(
                        child: Row(
                          children: [
                            Text(
                              "Row: ",
                              style: TextStyle(
                                fontSize: appHeight * .02,
                                color: Colors.deepPurple,
                                fontWeight: FontWeight.w700,
                              ),
                            ),
                            Text(
                              ticket.seatRow.join(','),
                              style: TextStyle(
                                fontSize: appHeight * .022,
                                color: Colors.black87,
                                fontWeight: FontWeight.w700,
                              ),
                            ),
                          ],
                        ),
                      ),

                      SizedBox(width: appWidth * .03),

                      //Time
                      Expanded(
                        child: Row(
                          children: [
                            Text(
                              "Seats: ",
                              style: TextStyle(
                                fontSize: appHeight * .02,
                                color: Colors.deepPurple,
                                fontWeight: FontWeight.w700,
                              ),
                            ),
                            Text(
                              ticket.seatNumber.join(','),
                              style: TextStyle(
                                fontSize: appHeight * .022,
                                color: Colors.black87,
                                fontWeight: FontWeight.w700,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                  Expanded(
                    child: BarcodeWidget(
                      data: 'data',
                      style: TextStyle(color: Colors.transparent),
                      barcode: Barcode.code128(),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class DottedDivider extends StatelessWidget {
  final double appWidth;
  const DottedDivider({super.key, required this.appWidth});

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        return CustomPaint(
          painter: DottedLinePainter(),
          size: Size(appWidth, 1),
        );
      },
    );
  }
}

class DottedLinePainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    Paint paint = Paint()
      ..color = Colors.black87
      ..strokeWidth = 1.5
      ..style = PaintingStyle.stroke;

    double dashWidth = 7, dashSpace = 4;
    double startX = 0;
    while (startX < size.width) {
      canvas.drawLine(Offset(startX, 0), Offset(startX + dashWidth, 0), paint);
      startX += dashWidth + dashSpace;
    }
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => false;
}
