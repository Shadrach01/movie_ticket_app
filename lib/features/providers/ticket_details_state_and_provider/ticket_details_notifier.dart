import 'dart:developer';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:movie_ticket/core/models/ticket_details_model.dart';
import 'package:movie_ticket/features/providers/ticket_details_state_and_provider/ticket_details_state.dart';

class TicketDetailsNotifier extends StateNotifier<TicketDetailsState> {
  TicketDetailsNotifier() : super(TicketDetailsState());

  void movieName(String name) {
    log("Movie name: $name");
    state = state.copyWith(name: name);
  }

  void moviePicture(String picture) {
    log("Movie picture: $picture");
    state = state.copyWith(picture: picture);
  }

  void movieDate(String date) {
    log("Movie date: $date");
    state = state.copyWith(date: date);
  }

  void movieTime(String time) {
    log("Movie time: $time");
    state = state.copyWith(time: time);
  }

  void movieSeatNumbers(List<int> seatNumbers) {
    log("Movie seat numbers: $seatNumbers");
    state = state.copyWith(seatNumbers: seatNumbers);
  }

  void movieSeatRow(List<int> seatRow) {
    log("Movie seat row: $seatRow");
    state = state.copyWith(seatRow: seatRow);
  }

  void bookTicket(List<TicketModel> bookedTickets) {
    log("Booked ticket list: $bookedTickets");

    state = state.copyWith(bookedTickets: bookedTickets);
  }
}
