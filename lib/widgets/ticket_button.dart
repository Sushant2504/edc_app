import 'package:flutter/material.dart';


class TicketButton extends StatefulWidget {
    final Widget child;
    final Color color;
    
    TicketButton({required this.child, required this.color});


    @override
    _TicketButtonState createState() => _TicketButtonState();
}


class _TicketButtonState extends State<TicketButton> with SingleTickerProviderStateMixin{
    late AnimationController controller;

    @override

    void initState() {
       super.initState();
      //  controller = AnimationController(vsync: this);
       controller = AnimationController(vsync: this, duration: Duration(milliseconds: 1800));
       controller.addStatusListener((status) {
           if(status == AnimationStatus.completed) {
              controller.reverse();
           }  else if (status == AnimationStatus.dismissed){
              
           }
       });
       controller.repeat();
    }

    @override
    void dispose() {
       controller.dispose();
       super.dispose();
    }

    @override
    Widget build(BuildContext context) {
        return AnimatedBuilder(
            animation: controller,
            builder: (context, index) {
                return Container(
                   alignment: Alignment.center,

                ),
            },
          
          
        );
    }
    
}