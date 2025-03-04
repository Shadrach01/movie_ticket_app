class TicketDetailsState {
  final String name;
  final String picture;
  final String date;
  final String time;
  final List<int> seatNumbers;
  final List<int> seatRow;

  TicketDetailsState({
    this.name = '',
    this.picture = '',
    this.date = '',
    this.time = '',
    List<int>? seatNumbers,
    List<int>? seatRow,
  })  : seatNumbers = seatNumbers ?? [],
        seatRow = seatRow ?? [];

  TicketDetailsState copyWith({
    String? name,
    String? picture,
    dynamic date,
    dynamic time,
    List<int>? seatNumbers,
    List<int>? seatRow,
  }) {
    return TicketDetailsState(
      name: name ?? this.name,
      picture: picture ?? this.picture,
      date: date ?? this.date,
      time: time ?? this.time,
      seatNumbers: seatNumbers ?? this.seatNumbers,
      seatRow: seatRow ?? this.seatRow,
    );
  }
}
