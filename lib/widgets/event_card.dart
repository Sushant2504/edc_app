import 'package:edc_app/utils/ui/app_styles.dart';
import 'package:edc_app/utils/ui/app_theme.dart';
import 'package:flutter/material.dart';
import '../models/startup_model.dart';

class EventCard extends StatelessWidget {
  final List<String> Title;
  final List<String> Subtitle;
  final int total;

  EventCard({required this.Title, required this.Subtitle, required this.total});

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    return Container(
      margin: const EdgeInsets.all(5),
      // padding: const EdgeInsets.all(25),
      height: height * 0.3,
      width: 400,

      decoration: Appthemes.keventCard,

      child: Column(
         
      ),
    );
  }
}

// this is for the inside contentin the event card widget ......
Widget TextContainer(List<String> title, List<String> subtitle, var height,
    var width, var index) {
  return Container(
    height: height * 0.2,
    width: width,
    color: Colors.transparent,
    child: Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title[index],
          style: AppStyles.ktitleStyle,
        ),
        Text(
          subtitle[index],
          style: AppStyles.ksubtitleStyle,
        ),
      ],
    ),
  );
}
