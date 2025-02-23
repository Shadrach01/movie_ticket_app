import 'package:flutter/cupertino.dart';

extension ScreenSizeExtension on BuildContext {
  double get appHeight => MediaQuery.of(this).size.height;
  double get appWidth => MediaQuery.of(this).size.width;
}
