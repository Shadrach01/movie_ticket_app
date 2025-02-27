import 'package:flutter/material.dart';
import 'package:movie_ticket/features/dashboard/domain/entities/movie_entity.dart';
import 'package:movie_ticket/features/movie_details/presentation/widgets/movie_details_screen_widgets.dart';

class MovieDetailsScreen extends StatelessWidget {
  final MovieEntity movie;
  const MovieDetailsScreen({super.key, required this.movie});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: MovieDetailsScreenWidgets(
        movie: movie,
      ),
    );
  }
}
