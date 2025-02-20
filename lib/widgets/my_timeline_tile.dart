import 'package:flutter/material.dart';
import 'package:timeline_tile/timeline_tile.dart';


class MyTimelineTile extends StatelessWidget {
   final bool isFirst;
   final bool isLast;
   final bool isPast;

   MyTimelineTile({
      super.key,
      required this.isFirst,
      required this.isLast,
      required this.isPast,
   });

   @override
   Widget build(BuildContext context) {
       return SizedBox(
        height: 200,
         child: TimelineTile(
            isFirst: isFirst,
            isLast: isLast,

            beforeLineStyle: LineStyle(color: isPast ? Colors.deepPurple : Colors.deepPurple.shade100),
            
            indicatorStyle: IndicatorStyle(
                width: 40,
                color: isPast ? Colors.deepPurple : Colors.deepPurple.shade100,
                iconStyle: IconStyle(
                  iconData: Icons.info,
                  color: isPast ? Colors.deepPurple : Colors.deepPurple.shade100
                ),
            ),

            // event card 

            // endChild: ,
         ),
       );
   }
}