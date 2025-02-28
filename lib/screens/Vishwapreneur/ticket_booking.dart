import 'package:edc_app/utils/ui/app_styles.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

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
                borderRadius: BorderRadius.circular(20.0),
                child: Image.network(
                     "https://img.freepik.com/free-vector/vintage-tickets-with-different-grange-textures_1284-44051.jpg?uid=R144673261&ga=GA1.1.367707074.1740647452&semt=ais_hybrid",
                      height: 350,
                      width: 350,
                 ),
              ),
            ),

            SizedBox(
              height: 40,
            ),

            // button for the ticket booking redirecting ......
            BookTicketButton(height, width),
            

          ],
        ),
      ),
    );
  }
}


// ticket button widget for redirecting from the button to the vierp .....
Widget BookTicketButton(var height, var width) {
  return InkWell(
    onTap: () {
      //
      _launchURL("https://learner.vierp.in/events");

    },
    child: Container(
      width: width * 0.8,
      height: height * 0.08,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15.0),
        gradient: LinearGradient(
          colors: [
            Color.fromARGB(255, 55, 16, 105),
            Color.fromARGB(255, 136, 90, 230)
          ],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
      ),

      child: Center(
          child: Text(
            'Book Ticket',
            style: AppStyles.kticketButtonLabelStyle,
          ),
      ),
    ),
  );
}



Future<void> _launchURL(String url) async {
  final Uri uri = Uri.parse(url);
  if (!await launchUrl(uri)) {
    throw Exception('Could not launch $url');
  }
}

//redirecting link ....

// https://learner.vierp.in/events
