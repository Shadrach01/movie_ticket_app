import 'package:flutter/material.dart';
import 'package:movie_ticket/core/common/widgets/app_text_fields.dart';
import 'package:movie_ticket/core/utils/screen_size.dart';
import '../../../../../core/utils/color_res.dart';

class LoginWidgets extends StatelessWidget {
  const LoginWidgets({super.key});

  @override
  Widget build(BuildContext context) {
    final appHeight = context.appHeight;
    final appWidth = context.appWidth;
    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
        gradient: ColorRes.backgroundLinearColor,
      ),
      padding: EdgeInsets.symmetric(
        vertical: appHeight * .02,
        horizontal: appWidth * .05,
      ),
      child: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          spacing: appHeight * .02,
          children: [
            Text(
              "L O G I N",
              style: TextStyle(
                color: Colors.black,
                fontSize: appHeight * .05,
                fontWeight: FontWeight.w900,
              ),
            ),
            AppTextField(),
            AppTextField(),
          ],
        ),
      ),
    );
  }
}
