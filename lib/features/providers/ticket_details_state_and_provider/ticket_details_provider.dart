import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:movie_ticket/features/providers/ticket_details_state_and_provider/ticket_details_notifier.dart';
import 'package:movie_ticket/features/providers/ticket_details_state_and_provider/ticket_details_state.dart';

final ticketDetailsProvider =
    StateNotifierProvider<TicketDetailsNotifier, TicketDetailsState>(
  (ref) => TicketDetailsNotifier(),
);
