import 'package:edc_app/screens/Vishwapreneur/gallery_screen.dart';
import 'package:edc_app/screens/Vishwapreneur/guest_screen.dart';
import 'package:edc_app/screens/Vishwapreneur/intro_screen.dart';
import 'package:edc_app/screens/Vishwapreneur/ticket_booking.dart';
import 'package:edc_app/utils/constants/app_colors.dart';
import 'package:flutter/material.dart';

class Navigation extends StatefulWidget {
  const Navigation({super.key});

  @override
  State<Navigation> createState() => _NavigationState();
}

class _NavigationState extends State<Navigation> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 4,
      child: Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          automaticallyImplyLeading: false,
          backgroundColor: Colors.white,
          centerTitle: true,
          bottom: PreferredSize(
            preferredSize: const Size.fromHeight(40),
            child: ClipRRect(
              borderRadius: const BorderRadius.all(Radius.circular(10)),
              child: Container(
                height: 50,
                width: double.infinity,
                margin:
                    const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                decoration: BoxDecoration(
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.9),
                      spreadRadius: 0,
                      blurRadius: 2,
                      offset: const Offset(0, 0), // changes position of shadow
                    ),
                  ],
                  borderRadius: const BorderRadius.all(Radius.circular(10)),
                  color: Colors.white,
                ),
                child: TabBar(
                  labelStyle:
                      const TextStyle(fontSize: 12, fontWeight: FontWeight.bold),
                  indicatorPadding:
                      const EdgeInsets.symmetric(vertical: 5, horizontal: 5),
                  indicatorSize: TabBarIndicatorSize.tab,
                  dividerColor: Colors.transparent,
                  indicator: BoxDecoration(
                    color: AppColors.accentColor,
                    borderRadius: const BorderRadius.all(Radius.circular(7)),
                  ),
                  labelColor: Colors.white,
                  unselectedLabelColor: Colors.black,
                  tabs: const [
                    Text("VP"),
                    Text("Guests"),
                    Text("Gallery"),
                    Text("Ticket"),
                  ],
                ),
              ),
            ),
          ),
        ),
        body: TabBarView(
          children: [ 
            Center(child: VPScreen()),
            Center(child: GuestScreen()),
            const Center(child: GalleryScreen()),  
            Center(child: TicketBooking()), 
          ],
        ),
      ),
    );
  }
}
