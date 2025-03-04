import 'package:flutter/material.dart';
import 'package:iconly/iconly.dart';
import 'package:movie_ticket/core/common/widgets/app_button.dart';
import 'package:movie_ticket/core/utils/screen_size.dart';
import 'package:movie_ticket/features/mobile_ticket_screen/screen/mobile_ticket_screen.dart';

import '../../../../core/utils/color_res.dart';

class DateTimeAndBuyButtonContainer extends StatelessWidget {
  const DateTimeAndBuyButtonContainer({super.key});

  @override
  Widget build(BuildContext context) {
    final height = context.appHeight;
    final width = context.appWidth;
    return Container(
      decoration: BoxDecoration(
        gradient: ColorRes.backgroundLinearColor,
      ),
      child: Column(
        spacing: height * .05,
        children: [
          Container(
            height: height * .002,
            color: Colors.blue.shade900,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Padding(
                padding: EdgeInsets.only(
                  left: width * .07,
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    _dateDetails(
                      height,
                      width,
                      IconlyBold.calendar,
                      "April 23, 2022",
                      "6 p.m.",
                    ),
                    SizedBox(height: height * .02),
                    _dateDetails(
                      height,
                      width,
                      IconlyBold.ticket,
                      "VIP Section",
                      "Seat 9,10",
                    ),
                    SizedBox(height: height * .02),
                    _dateDetails(
                      height,
                      width,
                      IconlyBold.buy,
                      "Total: \$30",
                      "",
                      dotRequired: false,
                    ),
                  ],
                ),
              ),
              _buyButton(height, width, context),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buyButton(double height, double width, BuildContext context) {
    return Container(
      height: height * .12,
      width: width * .28,
      decoration: BoxDecoration(
        color: Colors.red.withOpacity(.09),
        borderRadius: BorderRadius.horizontal(
          left: Radius.circular(150),
        ),
      ),
      child: Center(
        child: SizedBox(
          child: AppCircularButton(
            height: height * .09,
            width: width * .18,
            color: Colors.purple.shade700,
            onTap: () => Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => MobileTicketScreen(),
              ),
            ),
            child: Text(
              "Buy",
              style: TextStyle(
                color: Colors.white,
                fontSize: width * .045,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _dateDetails(
      double height, double width, IconData icon, String text1, String text2,
      {bool dotRequired = true}) {
    return Row(
      spacing: width * .02,
      children: [
        Icon(
          icon,
          color: Colors.white,
        ),
        Text(
          text1,
          style: TextStyle(
            color: Colors.white,
            fontSize: width * .04,
            fontWeight: FontWeight.w500,
          ),
        ),
        dotRequired
            ? Container(
                height: height * .01,
                width: width * .02,
                decoration: BoxDecoration(
                  color: Colors.white,
                  shape: BoxShape.circle,
                ),
              )
            : SizedBox(
                height: height * .01,
                width: width * .02,
              ),
        Text(
          text2,
          style: TextStyle(
            color: Colors.white,
            fontSize: width * .04,
            fontWeight: FontWeight.w500,
          ),
        ),
      ],
    );
  }
}
