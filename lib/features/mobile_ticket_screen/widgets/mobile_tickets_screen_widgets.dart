import 'package:dots_indicator/dots_indicator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:iconly/iconly.dart';
import 'package:movie_ticket/core/utils/screen_size.dart';
import 'package:movie_ticket/features/bottom_bar_screen.dart';
import 'package:movie_ticket/features/mobile_ticket_screen/widgets/ticket_details.dart';
import 'package:movie_ticket/features/mobile_ticket_screen/widgets/ticket_widget.dart';
import 'package:movie_ticket/features/providers/ticket_details_state_and_provider/ticket_details_provider.dart';

import '../../../core/common/widgets/app_button.dart';
import '../../../core/utils/color_res.dart';
import 'infinite_dragable_slider.dart';

class MobileTicketsScreenWidgets extends ConsumerWidget {
  const MobileTicketsScreenWidgets({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // Get the state
    final state = ref.watch(ticketDetailsProvider);

    final tickets = state.bookedTickets;

    final appHeight = context.appHeight;
    final appWidth = context.appWidth;
    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
        gradient: ColorRes.backgroundLinearColor,
      ),
      padding: EdgeInsets.symmetric(
        vertical: appHeight * .02,
        horizontal: appWidth * .05,
      ),
      child: SafeArea(
        child: Column(
          spacing: appHeight * .025,
          children: [
            _appBar(appHeight, appWidth, context),
            Text(
              "Once you buy a movie ticket simply scan the barcode "
              "to access to your movie.",
              style: TextStyle(
                color: Colors.white70,
                fontSize: appHeight * .03,
                fontWeight: FontWeight.w400,
                height: appHeight * .0015,
              ),
              textAlign: TextAlign.center,
            ),
            // TicketDetails(),
            tickets.isNotEmpty
                ? Expanded(
                    child: InfiniteDraggableSlider(
                      itemCount: tickets.length,
                      itemBuilder: (BuildContext context, int index) =>
                          TicketWidget(ticket: tickets[index]),
                    ),
                  )
                : Text(
                    "Not ticket has been booked yet",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 20,
                    ),
                  ),
            DotsIndicator(
              dotsCount: state.bookedTickets.length,
              decorator: DotsDecorator(
                activeColor: Colors.deepPurple,
                color: Colors.purple.withOpacity(.3),
              ),
            ),
            SizedBox(height: appHeight * .001),
          ],
        ),
      ),
    );
  }

  Widget _appBar(
    double appHeight,
    double appWidth,
    BuildContext context,
  ) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        AppCircularButton(
          height: appHeight * 0.07,
          width: appWidth * 0.15,
          color: Colors.purple.shade800,
          onTap: () {
            Navigator.of(context).pushAndRemoveUntil(
                MaterialPageRoute(
                  builder: (context) => BottomBarScreen(),
                ),
                (route) => false);
          },
          child: Icon(
            IconlyBold.arrow_left,
            color: Colors.white,
          ),
        ),
        Text(
          "Mobile Ticket",
          style: TextStyle(
            color: Colors.white70,
            fontSize: appWidth * .056,
            fontWeight: FontWeight.w900,
          ),
        ),
        AppCircularButton(
          height: appHeight * 0.07,
          width: appWidth * 0.15,
          color: Colors.purple.shade800,
          onTap: () {
            Navigator.of(context).pop();
          },
          child: Icon(
            Icons.more_vert_sharp,
            color: Colors.white,
          ),
        ),
      ],
    );
  }

  Widget _ticket() {
    return AppRectangularButton(
      child: Column(),
    );
  }
}
