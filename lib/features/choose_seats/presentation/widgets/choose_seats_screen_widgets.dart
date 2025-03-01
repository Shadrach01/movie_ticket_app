import 'package:flutter/material.dart';
import 'package:iconly/iconly.dart';
import 'package:movie_ticket/core/utils/screen_size.dart';

import '../../../../core/common/widgets/app_button.dart';

class ChooseSeatsScreenWidgets extends StatelessWidget {
  const ChooseSeatsScreenWidgets({super.key});

  @override
  Widget build(BuildContext context) {
    final appHeight = context.appHeight;
    final appWidth = context.appWidth;
    return SafeArea(
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: appWidth * .025),
        child: Column(
          children: [_appBar(appHeight, appWidth, context)],
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
        AppCircularButton(
          height: appHeight * 0.07,
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
        AppCircularButton(
          height: appHeight * 0.07,
          width: appWidth * 0.15,
          color: Colors.purple.shade800,
          onTap: () {
            Navigator.of(context).pop();
          },
          child: Icon(
            Icons.more_vert_sharp,
            color: Colors.white,
          ),
        ),
      ],
    );
  }
}
