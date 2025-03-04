import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:movie_ticket/core/common/widgets/app_text_fields.dart';
import 'package:movie_ticket/core/utils/color_res.dart';
import 'package:movie_ticket/core/utils/screen_size.dart';
import 'package:movie_ticket/features/dashboard/domain/entities/movie_entity.dart';
import 'package:movie_ticket/features/dashboard/presentation/widgets/movie_card.dart';

import '../../../providers/dash_board_providers.dart';

class DashboardScreenWidgets extends ConsumerWidget {
  const DashboardScreenWidgets({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final nowPlayingMovies = ref.watch(nowPlayingMoviesProvider);
    final upComingMovies = ref.watch(upComingMoviesProvider);
    final topRatedMovies = ref.watch(topRatedMoviesProvider);

    final appHeight = context.appHeight;
    final appWidth = context.appWidth;
    return Container(
      decoration: BoxDecoration(
        gradient: ColorRes.backgroundLinearColor,
      ),
      padding: EdgeInsets.symmetric(
        horizontal: appWidth * .05,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        spacing: appHeight * .025,
        children: [
          appBar(appHeight),
          searchField(appHeight),
          nowPlaying(appHeight, appWidth, nowPlayingMovies),
          comingSoon(appHeight, appWidth, upComingMovies),
          topMovies(appHeight, appWidth, topRatedMovies),
        ],
      ),
    );
  }

  AppBar appBar(double height) {
    return AppBar(
      centerTitle: true,
      backgroundColor: Colors.transparent,
      title: Text(
        "Choose Movie",
        style: TextStyle(
          color: Colors.white,
          fontSize: height * .03,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }

  // Searched field
  Widget searchField(double height) {
    return SizedBox(
      height: height * .055,
      child: AppTextField(
        hintText: "Search",
        prefixIcon: Icon(
          Icons.search,
          color: Colors.white.withOpacity(.7),
          size: height * .03,
        ),
        suffixIcon: Icon(
          Icons.mic,
          color: Colors.white.withOpacity(.7),
        ),
      ),
    );
  }

  Widget _buildMovieList(
    double appWidth,
    double appHeight,
    AsyncValue<List<MovieEntity>> moviesProvider,
  ) {
    return moviesProvider.when(
      data: (movies) {
        return ListView.builder(
          scrollDirection: Axis.horizontal,
          itemCount: movies.length,
          itemBuilder: (context, index) {
            final movie = movies[index];
            return MovieCard(movie: movie);
          },
        );
      },
      error: (error, stackTrace) => Center(
        child: Text('Error: ${error.toString()}'),
      ),
      loading: () => const Center(
        child: CircularProgressIndicator(),
      ),
    );
  }

  // Now playing section
  Widget nowPlaying(
    double appHeight,
    double appWidth,
    AsyncValue<List<MovieEntity>> moviesProvider,
  ) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      spacing: appHeight * .015,
      children: [
        Text(
          "Now Playing",
          style: TextStyle(
            color: Colors.white,
            fontSize: appWidth * .05,
            fontWeight: FontWeight.w900,
          ),
        ),
        SizedBox(
          height: appHeight * .165,
          child: _buildMovieList(appWidth, appHeight, moviesProvider),
        ),
      ],
    );
  }

  // Coming soon section
  Widget comingSoon(
    double appHeight,
    double appWidth,
    AsyncValue<List<MovieEntity>> moviesProvider,
  ) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      spacing: appHeight * .015,
      children: [
        Text(
          "Coming Soon",
          style: TextStyle(
            color: Colors.white,
            fontSize: appWidth * .05,
            fontWeight: FontWeight.w900,
          ),
        ),
        SizedBox(
          height: appHeight * .165,
          child: _buildMovieList(appWidth, appHeight, moviesProvider),
        ),
      ],
    );
  }

  // Top movies section
  Widget topMovies(
    double appHeight,
    double appWidth,
    AsyncValue<List<MovieEntity>> moviesProvider,
  ) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      spacing: appHeight * .015,
      children: [
        Text(
          "Top Movies ",
          style: TextStyle(
            color: Colors.white,
            fontSize: appWidth * .05,
            fontWeight: FontWeight.w900,
          ),
        ),
        SizedBox(
          height: appHeight * .165,
          child: _buildMovieList(appWidth, appHeight, moviesProvider),
        ),
      ],
    );
  }
}
