import 'package:flutter/material.dart';
import 'package:movie_ticket/core/common/widgets/app_button.dart';
import 'package:movie_ticket/core/utils/color_res.dart';
import 'package:movie_ticket/core/utils/screen_size.dart';
import 'package:movie_ticket/features/dashboard/presentation/screen/dashboard_screen.dart';
import 'package:iconly/iconly.dart';

class BottomBarScreen extends StatefulWidget {
  const BottomBarScreen({super.key});

  @override
  State<BottomBarScreen> createState() => _BottomBarScreenState();
}

class _BottomBarScreenState extends State<BottomBarScreen> {
  final List<Widget> screens = const [
    DashboardScreen(),
    Scaffold(backgroundColor: Colors.red),
    Scaffold(backgroundColor: Colors.blue),
    Scaffold(backgroundColor: Colors.grey),
    Scaffold(backgroundColor: Colors.purple),
  ];

  int currentScreen = 0;

  @override
  Widget build(BuildContext context) {
    final appHeight = context.appHeight;
    final appWidth = context.appWidth;

    return Scaffold(
      body: screens[currentScreen],
      bottomNavigationBar: Stack(
        clipBehavior: Clip.none, // Allows the selected button to move up
        children: [
          // Bottom Navigation Container
          Container(
            height: appHeight * 0.07,
            decoration: BoxDecoration(
              gradient: ColorRes.linearContainerGradient,
            ),
          ),

          // Navigation Buttons
          Positioned(
            top: -appHeight * 0.025, // Moves the entire button row UP
            left: 0,
            right: 0,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: List.generate(5, (index) {
                return GestureDetector(
                  onTap: () {
                    setState(() {
                      currentScreen = index;
                    });
                  },
                  child: navButton(
                    getIconForIndex(index),
                    isSelected: currentScreen == index,
                    appHeight: appHeight,
                    appWidth: appWidth,
                  ),
                );
              }),
            ),
          ),
        ],
      ),
    );
  }

  Widget navButton(
    IconData icon, {
    bool isSelected = false,
    required double appHeight,
    required double appWidth,
  }) {
    return AnimatedContainer(
      duration: Duration(milliseconds: 300),
      margin: isSelected
          ? EdgeInsets.only(
              bottom: appHeight * 0.035) // Moves selected button higher
          : EdgeInsets.zero,
      child: isSelected
          ? AppCircularButton(
              height: appHeight * 0.08,
              width: appWidth * 0.2,
              backgroundGradient: ColorRes.backgroundCircularGradientColor,
              color: Colors.purple.shade800,
              shadow: [
                BoxShadow(
                  color: Colors.black26,
                  blurRadius: 8,
                  spreadRadius: 2,
                  offset: Offset(0, 4),
                ),
              ],
              shape: BoxShape.circle,
              child: Icon(
                icon,
                color: Colors.white,
              ),
            )
          : Icon(
              icon,
              color: Colors.white,
              size: 27, // Larger icon for selected button
            ),
    );
  }

  IconData getIconForIndex(int index) {
    switch (index) {
      case 0:
        return IconlyBold.home;
      case 1:
        return IconlyBold.location;
      case 2:
        return IconlyBold.ticket;
      case 3:
        return IconlyBold.category;
      case 4:
        return IconlyBold.profile;
      default:
        return Icons.error;
    }
  }
}
