import 'package:flutter/material.dart';
import 'package:movie_ticket/core/utils/screen_size.dart';
import 'package:movie_ticket/features/movie_details/presentation/screen/movie_details_screen.dart';

class NowPlayingWidget extends StatelessWidget {
  const NowPlayingWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final appWidth = context.appWidth;
    return ListView.builder(
      scrollDirection: Axis.horizontal,
      shrinkWrap: true,
      itemCount: 6,
      itemBuilder: (context, index) {
        return GestureDetector(
          onTap: () {
            Navigator.of(context).push(
              MaterialPageRoute(
                builder: (context) => MovieDetailsScreen(),
              ),
            );
          },
          child: Container(
            width: appWidth * .3,
            margin: EdgeInsets.only(right: appWidth * .07),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(25),
              image: DecorationImage(
                image: AssetImage(
                  "assets/images/sonic.jpg",
                ),
                fit: BoxFit.fill,
              ),
            ),
          ),
        );
      },
    );
  }
}
