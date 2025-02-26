import 'package:flutter/material.dart';
import 'package:iconly/iconly.dart';
import 'package:movie_ticket/core/common/widgets/app_button.dart';
import 'package:movie_ticket/core/utils/color_res.dart';
import 'package:movie_ticket/core/utils/screen_size.dart';
import 'package:movie_ticket/features/movie_details/presentation/widgets/curved_date_selector.dart';

class MovieDetailsScreenWidgets extends StatelessWidget {
  const MovieDetailsScreenWidgets({super.key});

  @override
  Widget build(BuildContext context) {
    final appHeight = context.appHeight;
    final appWidth = context.appWidth;

    return Stack(
      children: [
        Container(
          color: ColorRes.darkBlue,
        ),
        // Image Container
        Container(
          height: appHeight * .6,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.only(
              bottomLeft: Radius.circular(appWidth * .3),
            ),
          ),
          child: ShaderMask(
            shaderCallback: (bounds) {
              return const LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [
                  Colors.transparent,
                  Colors.grey,
                ],
                stops: [.4, 0.8],
              ).createShader(bounds);
            },
            blendMode: BlendMode.dstOut,
            child: Container(
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage('assets/images/sonic.jpg'),
                  fit: BoxFit.fill,
                ),
              ),
            ),
          ),
        ),

        // SafeArea for UI elements on top
        SafeArea(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: appWidth * .03),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                _appBar(appHeight, appWidth, context),
                SizedBox(height: appHeight * 0.25),
                Text(
                  "Sonic the HedgeHog",
                  style: TextStyle(
                    fontSize: 30,
                    fontWeight: FontWeight.w900,
                    color: Colors.white,
                  ),
                ),
                SizedBox(height: appHeight * .03),
                Text(
                  "Sonic was refuksdc kiicoi lohcldshcluh ldhcljsdjkvc ldhjsv,jshvluh jdc"
                  " jdlhshdf,jkhlcvh jdnv cs knlvjs nf"
                  "c ldjhvlsjdfhjkh",
                  style: TextStyle(
                    fontSize: appWidth * .05,
                    fontWeight: FontWeight.normal,
                    color: Colors.white,
                  ),
                  textAlign: TextAlign.justify,
                ),
                SizedBox(height: appHeight * .02),
                Text(
                  "Select date and time",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: appWidth * .05,
                    fontWeight: FontWeight.w700,
                  ),
                ),
                SizedBox.shrink(),
                CurvedDateSelector(),
              ],
            ),
          ),
        ),
      ],
    );
  }

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
