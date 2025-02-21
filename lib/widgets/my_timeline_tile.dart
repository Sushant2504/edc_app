import 'package:flutter/material.dart';
import 'package:timeline_tile/timeline_tile.dart';

class MyTimelineTile extends StatelessWidget {
  final bool isFirst;
  final bool isLast;
  final bool isPast;
  final IconData isicon;
  final Widget isstart;
  final Widget isend;

  MyTimelineTile({
    super.key,
    required this.isFirst,
    required this.isLast,
    required this.isPast,
    required this.isicon,
    required this.isstart,
    required this.isend,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 180,
      child: TimelineTile(
        alignment: TimelineAlign.center,
        isFirst: isFirst,
        isLast: isLast,
        // decorate the lines
        beforeLineStyle: LineStyle(color: Colors.deepPurple.shade100),

        indicatorStyle: IndicatorStyle(
          width: 25,
          color: Colors.deepPurple,
          iconStyle: IconStyle(
            iconData: isicon,
            color: Colors.white,
          ),
        ),

        // event card

        startChild: isstart,
        endChild: isend,
      ),

      //  SizedBox(width: 10,),
    );
  }
}
