import 'package:flutter/material.dart';
import 'package:movie_ticket/features/movie_details/presentation/widgets/movie_details_screen_widgets.dart';

class MovieDetailsScreen extends StatelessWidget {
  const MovieDetailsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: MovieDetailsScreenWidgets(),
    );
  }
}
