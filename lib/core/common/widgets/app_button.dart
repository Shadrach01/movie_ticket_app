import 'package:flutter/material.dart';
import 'package:movie_ticket/core/utils/color_res.dart';
import 'package:movie_ticket/core/utils/screen_size.dart';

class AppCircularButton extends StatelessWidget {
  final Widget child;
  final void Function()? onTap;
  final double? height, width;

  final List<BoxShadow>? shadow;
  final Color? color;

  final Gradient? foregroundColor;

  const AppCircularButton({
    super.key,
    required this.child,
    this.onTap,
    this.height,
    this.width,
    this.shadow,
    this.foregroundColor,
    this.color,
  });

  @override
  Widget build(BuildContext context) {
    final appHeight = context.appHeight;
    final appWidth = context.appWidth;
    return GestureDetector(
      onTap: onTap,
      child: Stack(
        children: [
          Container(
            height: height,
            width: width,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              gradient: ColorRes.backgroundCircularGradientColor,
              boxShadow: shadow,
            ),
            alignment: Alignment.center,
            child: null,
          ),
          Positioned(
            top: appHeight * .0035,
            left: appWidth * .003,
            child: Container(
              height: height,
              width: width,
              decoration: BoxDecoration(
                color: color,
                gradient: foregroundColor,
                shape: BoxShape.circle,
              ),
              alignment: Alignment.center,
              child: child,
            ),
          ),
        ],
      ),
    );
  }
}

class AppRectangularButton extends StatelessWidget {
  final Widget child;
  final void Function()? onTap;
  final double? height, width, borderRadius;

  final List<BoxShadow>? shadow;
  final Color? color;

  final Gradient? foregroundColor, backgroundGradient;

  const AppRectangularButton({
    super.key,
    required this.child,
    this.onTap,
    this.height,
    this.width,
    this.borderRadius = 15,
    this.shadow,
    this.foregroundColor,
    this.backgroundGradient,
    this.color,
  });

  @override
  Widget build(BuildContext context) {
    final appHeight = context.appHeight;
    final appWidth = context.appWidth;
    return GestureDetector(
      onTap: onTap,
      child: Stack(
        children: [
          Container(
            height: height,
            width: width,
            decoration: BoxDecoration(
              shape: BoxShape.rectangle,
              gradient: backgroundGradient ??
                  ColorRes.backgroundCircularGradientColor,
              boxShadow: shadow,
              borderRadius: BorderRadius.circular(borderRadius!),
            ),
            alignment: Alignment.center,
            child: null,
          ),
          Positioned(
            top: appHeight * .0029,
            left: appWidth * .008,
            child: Container(
              height: height,
              width: width,
              decoration: BoxDecoration(
                color: color,
                gradient: foregroundColor,
                shape: BoxShape.rectangle,
                borderRadius: BorderRadius.circular(borderRadius!),
              ),
              alignment: Alignment.center,
              child: child,
            ),
          ),
        ],
      ),
    );
  }
}
