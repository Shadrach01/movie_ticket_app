import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'dart:math';
import 'package:movie_ticket/core/utils/screen_size.dart';

import '../../../../core/common/widgets/app_button.dart';

class CurvedDateSelector extends StatefulWidget {
  final DateTime date;
  final Function(DateTime) onDateSelected;
  const CurvedDateSelector({
    super.key,
    required this.date,
    required this.onDateSelected,
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
      viewportFraction: 0.19,
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

    final daysInMonth = DateUtils.getDaysInMonth(
      widget.date.year,
      widget.date.month,
    );

    return SizedBox(
      height: appHeight * 0.3,
      child: NotificationListener<ScrollNotification>(
        onNotification: (notification) {
          if (notification is ScrollUpdateNotification) {
            setState(() {
              centerIndex = _pageController.page!.round();

              // Get the selected date and pass it to the parent

              final selectedDate = DateTime(
                widget.date.year,
                widget.date.month,
                centerIndex + 1,
              );
              widget.onDateSelected(selectedDate);
            });
          }
          return true;
        },
        child: Container(
          padding: EdgeInsets.symmetric(
            vertical: appHeight * 0.025,
            // horizontal: appWidth * 0.02,
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
                widget.date.year,
                widget.date.month,
                index + 1,
              );

              final relativeIndex = index - centerIndex;
              final isCenter = index == centerIndex;

              // Reduced curve calculation parameters
              double verticalOffset;
              if (isCenter) {
                verticalOffset = 2; // Reduced center height
              } else {
                // Gentler parabolic curve
                final curveIntensity =
                    pow(relativeIndex.abs() * 0.8, 1.1); // Reduced multiplier
                verticalOffset = curveIntensity *
                    appHeight *
                    0.055; // Reduced height multiplier

                // Reduced sine wave component
                final sineComponent =
                    sin(relativeIndex.abs() * pi / 2) * appHeight * 0.02;
                verticalOffset += sineComponent;
              }

              // Reduced horizontal offset
              final horizontalOffset = relativeIndex.abs() > 0
                  ? (relativeIndex / relativeIndex.abs()) * appWidth * 0.02
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
      height: isSelected ? appHeight * .13 : appHeight * .09,
      width: isSelected ? appWidth * .17 : appWidth * .135,
      // width: isSelected ? appWidth * .17 : appWidth * .14,
      foregroundColor: LinearGradient(
        colors: isSelected
            ? [
                Color(0xFFB6116B),
                Color(0xFF2E1371),
              ]
            : [
                Color(0xFF2E1371),
                Color(0xFF21232F),
              ],
        begin: Alignment.topLeft,
        end: Alignment.bottomRight,
        stops: isSelected ? [0.3, .9] : [0.3, .86],
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
              fontWeight: isSelected ? FontWeight.w900 : FontWeight.w400,
            ),
          ),
          Text(
            "${date.day}",
            style: TextStyle(
              color: Colors.white,
              fontSize: appWidth * .06,
              fontWeight: isSelected ? FontWeight.w900 : FontWeight.w400,
            ),
          ),
        ],
      ),
    );
  }
}
