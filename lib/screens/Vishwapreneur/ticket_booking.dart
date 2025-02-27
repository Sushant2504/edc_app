import 'package:flutter/material.dart';

class TicketBooking extends StatefulWidget {
  @override
  _TicketBookingState createState() => _TicketBookingState();
}

class _TicketBookingState extends State<TicketBooking> {
  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    return SafeArea(
      child: Container(
        height: height,
        width: width,
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/images/bg-theme.png'),
            fit: BoxFit.cover,
            colorFilter: ColorFilter.mode(
              Colors.white.withOpacity(0.9), // Adjust opacity here (0.0 - 1.0)
              BlendMode.dstATop, // Ensures the overlay blends correctly
            ),
          ),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            // ticket bg image for interactivity........
            Center(
              child: ClipRRect(
                borderRadius: BorderRadius.circular(10.0),
                child: Image.asset('assets/images/ticket-bg.png'),
              ),
            ),


            SizedBox(height: 15,),


            // button for the ticket booking redirecting .......
            
          ],
        ),
      ),
    );
  }
}
