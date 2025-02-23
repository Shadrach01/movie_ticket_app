import 'package:flutter/material.dart';
import 'package:movie_ticket/features/bottom_bar_screen.dart';
import 'package:movie_ticket/features/dashboard/presentation/screen/dashboard_screen.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: const BottomBarScreen(),
    );
  }
}
