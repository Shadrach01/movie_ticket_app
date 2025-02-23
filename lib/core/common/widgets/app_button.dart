import 'package:flutter/material.dart';
import 'package:movie_ticket/core/utils/screen_size.dart';

class AppCircularButton extends StatelessWidget {
  final Widget child;
  final void Function()? onTap;
  final double? height, width;
  final BoxShape? shape;
  final List<BoxShadow>? shadow;
  final Color? color;

  final Gradient? backgroundGradient, foregroundColor;

  const AppCircularButton({
    super.key,
    required this.child,
    this.onTap,
    this.height,
    this.width,
    this.shape,
    this.shadow,
    this.backgroundGradient,
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
              shape: shape!,
              gradient: backgroundGradient,
              boxShadow: shadow,
            ),
            alignment: Alignment.center,
            child: child,
          ),
          Positioned(
            top: appHeight * .0026,
            left: appWidth * .004,
            child: Container(
              height: height,
              width: width,
              decoration: BoxDecoration(
                color: color,
                gradient: foregroundColor,
                shape: shape!,
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
