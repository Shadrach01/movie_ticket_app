import 'package:flutter/material.dart';
import 'package:movie_ticket/features/choose_seats/presentation/widgets/choose_seats_screen_widgets.dart';

class ChooseSeats extends StatelessWidget {
  const ChooseSeats({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: ChooseSeatsScreenWidgets(),
    );
  }
}
