import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'dart:math';
import 'package:movie_ticket/core/utils/screen_size.dart';

import '../../../../core/common/widgets/app_button.dart';

class CurvedDateSelector extends StatefulWidget {
  const CurvedDateSelector({
    super.key,
  });

  @override
  State<CurvedDateSelector> createState() => _CurvedDateSelectorState();
}

class _CurvedDateSelectorState extends State<CurvedDateSelector> {
  late ScrollController _scrollController;
  late int centerIndex;
  late PageController _pageController;

  @override
  void initState() {
    super.initState();
    centerIndex = 2;
    _pageController = PageController(
      viewportFraction: 0.28,
      initialPage: centerIndex,
    );
    _scrollController = ScrollController();
  }

  @override
  void dispose() {
    _pageController.dispose();
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final appHeight = context.appHeight;
    final appWidth = context.appWidth;
    final currentDate = DateTime.now();
    final daysInMonth = DateUtils.getDaysInMonth(
      currentDate.year,
      currentDate.month,
    );

    return SizedBox(
      height: appHeight * 0.35,
      child: NotificationListener<ScrollNotification>(
        onNotification: (notification) {
          if (notification is ScrollUpdateNotification) {
            setState(() {
              centerIndex = _pageController.page!.round();
            });
          }
          return true;
        },
        child: Container(
          padding: EdgeInsets.symmetric(
            vertical: appHeight * 0.08,
            horizontal: appWidth * 0.04,
          ),
          child: PageView.builder(
            controller: _pageController,
            itemCount: daysInMonth,
            onPageChanged: (index) {
              setState(() {
                centerIndex = index;
              });
            },
            itemBuilder: (context, index) {
              final date = DateTime(
                currentDate.year,
                currentDate.month,
                index + 1,
              );

              final relativeIndex = index - centerIndex;
              final isCenter = index == centerIndex;

              // Reduced curve calculation parameters
              double verticalOffset;
              if (isCenter) {
                verticalOffset = 0; // Reduced center height
              } else {
                // Gentler parabolic curve
                final curveIntensity =
                    pow(relativeIndex.abs() * 0.9, 2); // Reduced multiplier
                verticalOffset = curveIntensity *
                    appHeight *
                    0.04; // Reduced height multiplier

                // Reduced sine wave component
                // final sineComponent =
                //     sin(relativeIndex.abs() * pi / 2) * appHeight * 0.02;
                // verticalOffset += sineComponent;
              }

              // Reduced horizontal offset
              final horizontalOffset = relativeIndex.abs() > 0
                  ? (relativeIndex / relativeIndex.abs()) * appWidth * 0.003
                  : 0.0;

              return Transform.translate(
                offset: Offset(horizontalOffset, verticalOffset),
                child: Opacity(
                  opacity: 1.0 -
                      (relativeIndex.abs() * 0.2)
                          .clamp(0.0, 0.9), // Adjusted opacity fade
                  child: _dateButton(
                    date,
                    appHeight,
                    appWidth,
                    isSelected: isCenter,
                  ),
                ),
              );
            },
          ),
        ),
      ),
    );
  }

  Widget _dateButton(
    DateTime date,
    double appHeight,
    double appWidth, {
    bool isSelected = false,
  }) {
    return AppRectangularButton(
      height: isSelected ? appHeight * .15 : appHeight * .12,
      width: isSelected ? appWidth * .25 : appWidth * .15,
      foregroundColor: LinearGradient(
        colors: isSelected
            ? [
                Color(0xFF4A238E),
                Color(0xFFA03DA0),
              ]
            : [
                Color(0xFF4A238E),
                Colors.blue,
              ],
        stops: [0.07, 1.0],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            DateFormat('EEE').format(date),
            style: TextStyle(
              color: Colors.white,
              fontSize: appWidth * .05,
            ),
          ),
          Text(
            "${date.day}",
            style: TextStyle(
              color: Colors.white,
              fontSize: appWidth * .06,
              fontWeight: FontWeight.w900,
            ),
          ),
        ],
      ),
    );
  }
}
