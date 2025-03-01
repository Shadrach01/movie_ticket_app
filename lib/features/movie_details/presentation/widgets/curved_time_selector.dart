import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'dart:math';
import 'package:movie_ticket/core/utils/screen_size.dart';

import '../../../../core/common/widgets/app_button.dart';

class CurvedTimeSelector extends StatefulWidget {
  const CurvedTimeSelector({
    super.key,
  });

  @override
  State<CurvedTimeSelector> createState() => _CurvedTimeSelectorState();
}

class _CurvedTimeSelectorState extends State<CurvedTimeSelector> {
  late ScrollController _scrollController;
  late int centerIndex;
  late PageController _pageController;

  final List<DateTime> _timeSlots = List.generate(
    24,
    (index) => DateTime(2024, 1, 1, index, 0),
  );

  @override
  void initState() {
    super.initState();
    centerIndex = DateTime.now().hour;
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

    return SizedBox(
      height: appHeight * 0.25,
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
            vertical: appHeight * 0.025,
          ),
          child: PageView.builder(
            controller: _pageController,
            itemCount: _timeSlots.length,
            onPageChanged: (index) {
              setState(() {
                centerIndex = index;
              });
            },
            itemBuilder: (context, index) {
              final time = _timeSlots[index];

              final relativeIndex = index - centerIndex;
              final isCenter = index == centerIndex;

              // Reduced curve calculation parameters
              double horizontalOffset;
              if (isCenter) {
                horizontalOffset = 6; // Reduced center height
              } else {
                // Gentler parabolic curve
                final curveIntensity =
                    pow(relativeIndex.abs() * 0.67, 1.0); // Reduced multiplier
                horizontalOffset = curveIntensity *
                    appHeight *
                    0.055; // Reduced height multiplier

                // Reduced sine wave component
                final sineComponent =
                    sin(relativeIndex.abs() * pi / 2) * appWidth * 0.02;
                horizontalOffset += sineComponent;
              }

              // Reduced horizontal offset
              final verticalOffset = relativeIndex.abs() > 0
                  ? (relativeIndex / relativeIndex.abs()) * appHeight * 0.01
                  : 0.0;

              return Transform.translate(
                offset: Offset(verticalOffset, horizontalOffset),
                child: Opacity(
                  opacity: 1.0 -
                      (relativeIndex.abs() * 0.2)
                          .clamp(0.0, 0.9), // Adjusted opacity fade
                  child: _timeButton(
                    time,
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

  Widget _timeButton(
    DateTime time,
    double appHeight,
    double appWidth, {
    bool isSelected = false,
  }) {
    return AppRectangularButton(
      height: isSelected ? appHeight * .065 : appHeight * .055,
      width: isSelected ? appWidth * .17 : appWidth * .15,
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
        stops: isSelected ? [0.3, .94] : [0.3, .86],
      ),
      child: Text(
        DateFormat('HH:mm').format(time),
        style: TextStyle(
          color: Colors.white,
          fontSize: isSelected ? appWidth * .05 : appWidth * .04,
          fontWeight: isSelected ? FontWeight.bold : FontWeight.normal,
        ),
      ),
    );
  }
}
