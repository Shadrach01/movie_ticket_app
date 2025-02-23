import 'package:flutter/material.dart';
import 'package:movie_ticket/features/dashboard/presentation/widgets/dashboard_screen_widgets.dart';

class DashboardScreen extends StatelessWidget {
  const DashboardScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: DashboardScreenWidgets(),
    );
  }
}
