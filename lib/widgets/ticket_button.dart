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
              controller.forward(from: 0);
           }  
       });

       controller.forward();
    }

    @override
    void dispose() {
       controller.dispose();
       super.dispose();
    }

    @override
    Widget build(BuildContext context) {
        var height = MediaQuery.of(context).size.height;
        var width = MediaQuery.of(context).size.width;

        return AnimatedBuilder(
            animation: controller,
            builder: (context, index) {
                return Container(
                   width: width,
                   height: height,
                   decoration: BoxDecoration(
                       borderRadius: BorderRadius.circular(10),
                    //    gradient: ishover ? 
                   ),
                   
                    
                   
                   


                );
            },
          
          
        );
    }
    
}




//  item for animated button .....
class MyButtonItems extends StatefulWidget {
  final Widget child;
  final Color color;
  const MyButtonItems({super.key, required this.child, required this.color});

  @override
  State<MyButtonItems> createState() => _MyButtonItemsState();
}

class _MyButtonItemsState extends State<MyButtonItems>
    with SingleTickerProviderStateMixin {
  late AnimationController controller;

  @override
  void initState() {
    super.initState();
    controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 1800),
    );
    // for reverse  as well
    controller.addStatusListener((status) {
      if (status == AnimationStatus.completed) {
        controller.reverse();
      } else if (status == AnimationStatus.dismissed) {
        controller.forward(from: 0.0);
      }
    });
    controller.forward();
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: AnimatedBuilder(
        animation: controller,
        builder: (context, index) {
          return Container(
            alignment: Alignment.center,
            padding: const EdgeInsets.all(15),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              gradient: LinearGradient(colors: [
                Colors.purple,
                widget.color,
                Colors.blue,
              ], stops: [
                0.0,
                controller.value,
                1.0,
              ]),
            ),
            child: widget.child,
          );
        },
      ),
    );
  }
}

