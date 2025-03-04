import 'package:flutter/material.dart';
import 'package:iconly/iconly.dart';
import 'package:movie_ticket/core/utils/color_res.dart';
import 'package:movie_ticket/core/utils/screen_size.dart';
import 'package:movie_ticket/features/choose_seats/presentation/widgets/glowing_arc_widget.dart';
import 'package:movie_ticket/features/choose_seats/presentation/widgets/seating_chart_settings.dart';
import 'package:movie_ticket/features/choose_seats/presentation/widgets/selected_ticket_and_button.dart';

import '../../../../core/common/widgets/app_button.dart';

class ChooseSeatsScreenWidgets extends StatelessWidget {
  const ChooseSeatsScreenWidgets({super.key});

  @override
  Widget build(BuildContext context) {
    final appHeight = context.appHeight;
    final appWidth = context.appWidth;
    return Container(
      decoration: BoxDecoration(
        gradient: ColorRes.backgroundLinearColor,
      ),
      child: SafeArea(
        child: Column(
          children: [
            Padding(
              padding: EdgeInsets.symmetric(
                horizontal: appWidth * .03,
                vertical: appHeight * .02,
              ),
              child: Column(
                children: [
                  _appBar(appHeight, appWidth, context),
                  SizedBox(height: appHeight * .035),
                  GlowingArcWidget(),
                  SeatingChartSettings(),
                ],
              ),
            ),
            Expanded(
              child: DateTimeAndBuyButtonContainer(),
            ),
          ],
        ),
      ),
    );
  }

  // App bar
  Widget _appBar(
    double appHeight,
    double appWidth,
    BuildContext context,
  ) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        SizedBox(
          height: appHeight * .07,
          child: AppCircularButton(
            height: appHeight * 0.06,
            width: appWidth * 0.15,
            color: Colors.purple.shade800,
            onTap: () {
              Navigator.of(context).pop();
            },
            child: Icon(
              IconlyBold.arrow_left,
              color: Colors.white,
            ),
          ),
        ),
        Text(
          "Choose Seats",
          style: TextStyle(
            color: Colors.white,
            fontSize: appWidth * .055,
            fontWeight: FontWeight.bold,
          ),
        ),
        SizedBox(
          height: appHeight * .07,
          child: AppCircularButton(
            height: appHeight * 0.06,
            width: appWidth * 0.15,
            color: Colors.purple.shade800,
            onTap: () {
              Navigator.of(context).pop();
            },
            child: Icon(
              IconlyBold.calendar,
              color: Colors.white,
            ),
          ),
        ),
      ],
    );
  }
}
