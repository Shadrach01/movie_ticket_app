import 'package:movie_ticket/core/models/ticket_details_model.dart';

class TicketDetailsState {
  final String name;
  final String picture;
  final String date;
  final String time;
  final List<int> seatNumbers;
  final List<int> seatRow;

  final List<TicketModel> bookedTickets;

  TicketDetailsState({
    this.name = '',
    this.picture = '',
    this.date = '',
    this.time = '',
    List<int>? seatNumbers,
    List<int>? seatRow,
    List<TicketModel>? bookedTickets,
  })  : seatNumbers = seatNumbers ?? [],
        seatRow = seatRow ?? [],
        bookedTickets = bookedTickets ?? [];

  TicketDetailsState copyWith({
    String? name,
    String? picture,
    String? date,
    String? time,
    List<int>? seatNumbers,
    List<int>? seatRow,
    List<TicketModel>? bookedTickets,
  }) {
    return TicketDetailsState(
      name: name ?? this.name,
      picture: picture ?? this.picture,
      date: date ?? this.date,
      time: time ?? this.time,
      seatNumbers: seatNumbers ?? this.seatNumbers,
      seatRow: seatRow ?? this.seatRow,
      bookedTickets: bookedTickets ?? this.bookedTickets,
    );
  }
}
