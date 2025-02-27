import 'package:edc_app/widgets/flutter_tinckercard_plus.dart';
import 'package:edc_app/widgets/startup_card.dart';
import 'package:flutter/material.dart';
import 'package:edc_app/models/startup_model.dart';

class StartupCardsWidget extends StatefulWidget {
  final double height;
  final double width;
  final List<StartupModel> startup;

  const StartupCardsWidget({
    required this.height,
    required this.width,
    required this.startup,
  });

  @override
  _StartupCardsWidgetState createState() => _StartupCardsWidgetState();
}

class _StartupCardsWidgetState extends State<StartupCardsWidget> {
  late CardController _cardController;
  int _currentIndex = 0;

  @override
  void initState() {
    super.initState();
    _cardController = CardController();
  }

   void _onSwipeComplete(CardSwipeOrientation orientation, int index) {
    setState(() {
      // Update the current index
      _currentIndex = (index + 1) % widget.startup.length;

      // If it's the last card, reset the index to 0
      if (_currentIndex == 0) {
        _currentIndex = 0; // Reset to the first card
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: widget.height * 0.55,
      child: TinderSwapCard(
        swipeUp: true,
        swipeDown: true,
        orientation: AmassOrientation.bottom,
        totalNum: widget.startup.length,
        stackNum: 3,
        swipeEdge: 4.0,
        maxWidth: widget.width * 0.97,
        maxHeight: widget.height * 0.55,
        minWidth: widget.width * 0.80,
        minHeight: widget.height * 0.40,
        cardBuilder: (context, index) {
          // Use the circular index logic
          final cardIndex = (_currentIndex + index) % widget.startup.length;
          return Card(
            child: StartupCard(widget.startup[cardIndex]),
          );
        },
        cardController: _cardController,
        swipeCompleteCallback: _onSwipeComplete,
      ),
    );
  }
}