import 'package:flutter/material.dart';

class ColorRes {
  ColorRes._();

  static RadialGradient backgroundLinearColor = RadialGradient(
    center: const Alignment(.8, .4),
    colors: [
      Color(0xff800080),
      Color(0xff2E1371),
    ],
    radius: .9,
  );

  static LinearGradient backgroundCircularGradientColor = const LinearGradient(
    colors: [
      Color(0xFF66CDAA),
      Color(0xFF008000), // Dark Green
      // Medium Light Green (Fading Effect)
    ],
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
  );

  static LinearGradient linearContainerGradient = LinearGradient(
    colors: [
      Color(0xFFA031F0), // Medium-light purple
      Color(0xFF4A238E), // Deep but softer purple
      Color(0xFFA03DA0),
    ],
    stops: [0.05, 0.07, 1.0],
  );

  static LinearGradient foregroundContainerGradient = LinearGradient(
    colors: [
      Color(0xFFA031F0), // Medium-light purple
      Colors.yellowAccent, // Deep but softer purple
      Color(0xFFA03DA0),
    ],
    stops: [0.05, 0.07, 1.0],
  );
}
