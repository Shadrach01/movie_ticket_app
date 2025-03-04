class TicketModel {
  final String name;
  final String picture;
  final String date;
  final String time;
  final List<int> seatNumber;
  final List<int> seatRow;

  const TicketModel({
    required this.name,
    required this.picture,
    required this.date,
    required this.time,
    required this.seatNumber,
    required this.seatRow,
  });
}
