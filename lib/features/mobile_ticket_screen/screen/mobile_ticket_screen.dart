import 'package:flutter/material.dart';
import 'package:movie_ticket/features/mobile_ticket_screen/widgets/mobile_tickets_screen_widgets.dart';

class MobileTicketScreen extends StatelessWidget {
  const MobileTicketScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: MobileTicketsScreenWidgets(),
    );
  }
}
