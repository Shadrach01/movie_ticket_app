import 'package:flutter/material.dart';
import 'package:movie_ticket/core/utils/screen_size.dart';

enum SeatStatus { available, reserved, selected }

class SeatData {
  SeatStatus? status;

  SeatData(this.status);
}

class SeatingChartSettings extends StatefulWidget {
  const SeatingChartSettings({super.key});

  @override
  State<SeatingChartSettings> createState() => _SeatingChartSettingsState();
}

class _SeatingChartSettingsState extends State<SeatingChartSettings> {
  //List of rows, each containing a list of seat data
  final List<List<SeatData>> _seatingRows = [];
  SeatData? _selectedSeat;
  int _selectedRowIndex = -1;
  int _selectedSeatIndex = -1;

  @override
  void initState() {
    super.initState();

    _initializeSeatingLayout();
  }

  void _initializeSeatingLayout() {
    // Row 1
    _seatingRows.add([
      SeatData(SeatStatus.reserved),
      SeatData(SeatStatus.reserved),
      SeatData(SeatStatus.available),
      SeatData(null),
      SeatData(null),
      SeatData(SeatStatus.reserved),
      SeatData(SeatStatus.reserved),
      SeatData(SeatStatus.available),
    ]);

    // Row 2
    _seatingRows.add([
      SeatData(SeatStatus.reserved),
      SeatData(SeatStatus.reserved),
      SeatData(SeatStatus.available),
      SeatData(SeatStatus.available),
      SeatData(null),
      SeatData(SeatStatus.reserved),
      SeatData(SeatStatus.reserved),
      SeatData(SeatStatus.reserved),
      SeatData(SeatStatus.available),
    ]);

    // Row 3 (empty)
    _seatingRows.add([
      SeatData(null),
      SeatData(null),
      SeatData(null),
      SeatData(null),
      SeatData(null),
      SeatData(null),
      SeatData(null),
      SeatData(null),
    ]);

    // Row 4
    _seatingRows.add([
      SeatData(SeatStatus.reserved),
      SeatData(SeatStatus.reserved),
      SeatData(SeatStatus.reserved),
      SeatData(SeatStatus.available),
      SeatData(SeatStatus.available),
      SeatData(SeatStatus.reserved),
      SeatData(SeatStatus.available),
      SeatData(SeatStatus.reserved),
    ]);

    // Row 5
    _seatingRows.add([
      SeatData(SeatStatus.available),
      SeatData(SeatStatus.available),
      SeatData(SeatStatus.reserved),
      SeatData(SeatStatus.reserved),
      SeatData(SeatStatus.reserved),
      SeatData(SeatStatus.reserved),
      SeatData(SeatStatus.available),
      SeatData(SeatStatus.available),
      SeatData(SeatStatus.available),
    ]);

    // Row 6
    _seatingRows.add([
      SeatData(SeatStatus.reserved),
      SeatData(SeatStatus.reserved),
      SeatData(SeatStatus.reserved),
      SeatData(SeatStatus.available),
      SeatData(SeatStatus.available),
      SeatData(SeatStatus.available),
      SeatData(SeatStatus.available),
      SeatData(SeatStatus.reserved),
      SeatData(SeatStatus.reserved),
    ]);

    // Row 7
    _seatingRows.add([
      SeatData(SeatStatus.available),
      SeatData(SeatStatus.available),
      SeatData(SeatStatus.reserved),
      SeatData(SeatStatus.reserved),
      SeatData(SeatStatus.reserved),
      SeatData(SeatStatus.available),
      SeatData(SeatStatus.available),
      SeatData(SeatStatus.reserved),
      SeatData(SeatStatus.reserved),
    ]);
  }

  void _selectSeat(int rowIndex, int seatIndex) {
    final seat = _seatingRows[rowIndex][seatIndex];

    if (seat.status == SeatStatus.reserved) {
      return; // Do noting if the seat is reserved
    }
    setState(() {
      if (seat.status == SeatStatus.available) {
        // Change available seat to selected
        seat.status = SeatStatus.selected;
      } else if (seat.status == SeatStatus.selected) {
        // Toggle back to available
        seat.status = SeatStatus.available;
      }
      _selectedRowIndex = rowIndex;
      _selectedSeatIndex = seatIndex;
      _selectedSeat = _seatingRows[rowIndex][seatIndex];
    });
  }

  @override
  Widget build(BuildContext context) {
    final height = context.appHeight;
    final width = context.appWidth;
    return Column(
      spacing: height * .015,
      children: [
        // Seating chart
        Column(
          children: List.generate(
            _seatingRows.length,
            (rowIndex) => Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: List.generate(
                _seatingRows[rowIndex].length,
                (seatIndex) {
                  final seat = _seatingRows[rowIndex][seatIndex];
                  return GestureDetector(
                    onTap: () {
                      if (seat.status != SeatStatus.reserved) {
                        _selectSeat(rowIndex, seatIndex);
                      }
                    },
                    child: SeatWidget(
                      seat: seat,
                      isSelected: _selectedRowIndex == rowIndex &&
                          _selectedSeatIndex == seatIndex,
                      rowLabel:
                          String.fromCharCode(65 + rowIndex), // A, B, C, etc.
                      seatNumber: seatIndex + 1,
                    ),
                  );
                },
              ),
            ),
          ),
        ),

        // Legend
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            _buildLegendItem(Colors.white, 'Available', height, width),
            const SizedBox(width: 16),
            _buildLegendItem(Colors.blue, 'Selected', height, width),
            const SizedBox(width: 16),
            _buildLegendItem(Colors.red, 'Reserved', height, width),
          ],
        ),
      ],
    );
  }

  Widget _buildLegendItem(
    Color color,
    String label,
    double height,
    double width,
  ) {
    return Row(
      children: [
        Container(
          width: width * .03,
          height: height * .03,
          decoration: BoxDecoration(
            color: color,
            shape: BoxShape.circle,
          ),
        ),
        const SizedBox(width: 8),
        Text(
          label,
          style: const TextStyle(color: Colors.grey),
        ),
      ],
    );
  }
}

class SeatWidget extends StatelessWidget {
  final SeatData seat;
  final bool isSelected;
  final String rowLabel;
  final int seatNumber;

  const SeatWidget({
    super.key,
    required this.seat,
    this.isSelected = false,
    required this.rowLabel,
    required this.seatNumber,
  });

  @override
  Widget build(BuildContext context) {
    final height = context.appHeight;
    final width = context.appWidth;

    // If seat status is null, render an empty space
    if (seat.status == null) {
      return SizedBox(
        width: width * .097,
        height: height * .04,
      );
    }

    // Get color based on seat status
    Color seatColor;
    switch (seat.status) {
      case SeatStatus.available:
        seatColor = Colors.white;
        break;
      case SeatStatus.selected:
        seatColor = Colors.blue;
        break;
      case SeatStatus.reserved:
        seatColor = Colors.pink.shade900;
        break;
      default:
        seatColor = Colors.grey;
    }

    // Render a seat
    return Container(
      width: width * .097,
      height: height * .045,
      margin: EdgeInsets.only(left: width * .007, bottom: height * .012),
      decoration: BoxDecoration(
        color: seatColor,
        borderRadius: const BorderRadius.only(
          topLeft: Radius.circular(5),
          topRight: Radius.circular(5),
        ),
        border: isSelected
            ? Border.all(color: Colors.yellow, width: 2)
            : Border.all(color: Colors.black26),
      ),
      child: Center(
        child: Text(
          '$seatNumber',
          style: TextStyle(
            fontSize: 10,
            fontWeight: FontWeight.bold,
            color: seat.status == SeatStatus.available
                ? Colors.black
                : Colors.white,
          ),
        ),
      ),
    );
  }
}
