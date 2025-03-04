import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:iconly/iconly.dart';
import 'package:intl/intl.dart';
import 'package:movie_ticket/core/common/widgets/app_button.dart';
import 'package:movie_ticket/core/utils/color_res.dart';
import 'package:movie_ticket/core/utils/screen_size.dart';
import 'package:movie_ticket/features/choose_seats/presentation/screen/choose_seats.dart';
import 'package:movie_ticket/features/movie_details/presentation/widgets/curved_date_selector.dart';
import 'package:movie_ticket/features/providers/ticket_details_state_and_provider/ticket_details_provider.dart';
import 'package:readmore/readmore.dart';
import '../../../dashboard/domain/entities/movie_entity.dart';
import 'curved_time_selector.dart';

class MovieDetailsScreenWidgets extends ConsumerWidget {
  final MovieEntity movie;
  const MovieDetailsScreenWidgets({super.key, required this.movie});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final appHeight = context.appHeight;
    final appWidth = context.appWidth;

    final backdropUrl = 'https://image.tmdb.org/t/p/w500${movie.backdropPath}';
    final posterUrl = 'https://image.tmdb.org/t/p/w200${movie.posterPath}';

    final initialDate = DateTime.now();

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
                  image: NetworkImage(backdropUrl),
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ),
        ),

        // SafeArea for UI elements on top
        SafeArea(
          child: Padding(
            padding: EdgeInsets.only(
              left: appWidth * .02,
              right: appWidth * .02,
              top: appHeight * .007,
              bottom: appHeight * .02,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                _appBar(appHeight, appWidth, context),
                SizedBox(height: appHeight * 0.15),
                Expanded(
                  child: SingleChildScrollView(
                    child: Column(
                      children: [
                        Text(
                          movie.title,
                          style: TextStyle(
                            fontSize: 30,
                            fontWeight: FontWeight.w900,
                            color: Colors.white,
                          ),
                        ),
                        SizedBox(height: appHeight * .02),
                        ReadMoreText(
                          movie.overview,
                          trimLines: 3,
                          trimMode: TrimMode.Line,
                          moreStyle: TextStyle(
                            fontSize: appWidth * .05,
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                          ),
                          lessStyle: TextStyle(
                            fontSize: appWidth * .05,
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                          ),
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
                        Container(
                          margin: EdgeInsets.only(
                              bottom: appHeight *
                                  0.02), // Space between label and date selector
                          child: CurvedDateSelector(
                            date: initialDate,
                            onDateSelected: (date) {
                              // Format to show only date
                              final formattedDate =
                                  DateFormat('MMMM d, y').format(date);
                              // update the selected date when changed
                              ref
                                  .read(ticketDetailsProvider.notifier)
                                  .movieDate(formattedDate);
                            },
                          ),
                        ),
                        Transform.translate(
                          offset: Offset(0, -appHeight * .15),
                          child: CurvedTimeSelector(
                            time: initialDate,
                            onTimeSelected: (time) {
                              final formattedTime =
                                  DateFormat('hh:mm a').format(time);

                              ref
                                  .read(ticketDetailsProvider.notifier)
                                  .movieTime(formattedTime);
                            },
                          ),
                        ),
                        Transform.translate(
                          offset: Offset(0, -appHeight * .2),
                          child: _reservationButton(
                            appHeight,
                            appWidth,
                            context,
                            onTap: () {
                              ref
                                  .read(ticketDetailsProvider.notifier)
                                  .movieName(movie.title);

                              ref
                                  .read(ticketDetailsProvider.notifier)
                                  .moviePicture(posterUrl);

                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => ChooseSeats(),
                                ),
                              );
                            },
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
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

  Widget _reservationButton(
    double appHeight,
    double appWidth,
    BuildContext context, {
    required void Function() onTap,
  }) {
    return AppRectangularButton(
      height: appHeight * .082,
      width: appWidth * .92,
      borderRadius: 20,
      onTap: onTap,
      foregroundColor: LinearGradient(
        colors: [
          Color(0xFFB6116B),
          Color(0xFF2E1371),
        ],
        begin: Alignment.topLeft,
        end: Alignment.bottomCenter,
        stops: [.09, .9],
      ),
      child: Text(
        "Reservation",
        style: TextStyle(
          color: Colors.white,
          fontSize: appWidth * .06,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }
}
