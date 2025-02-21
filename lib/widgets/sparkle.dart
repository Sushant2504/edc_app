import 'package:flutter/material.dart';
import 'dart:math' as math;

class Sparkle extends StatefulWidget {
  final double size;
  final Color color;

  const Sparkle({
    super.key,
    this.size = 4,
    this.color = Colors.white,
  });

  @override
  State<Sparkle> createState() => _SparkleState();
}

class _SparkleState extends State<Sparkle> with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late double _randomX;
  late double _randomY;

  @override
  void initState() {
    super.initState();
    _randomX = math.Random().nextDouble();
    _randomY = math.Random().nextDouble();
    _controller = AnimationController(
      duration: Duration(milliseconds: 1500 + math.Random().nextInt(1000)),
      vsync: this,
    )..repeat(reverse: true);
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _controller,
      builder: (context, child) {
        return Positioned(
          left: _randomX * MediaQuery.of(context).size.width,
          top: _randomY * MediaQuery.of(context).size.height,
          child: Opacity(
            opacity: _controller.value,
            child: Container(
              width: widget.size,
              height: widget.size,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: widget.color,
                boxShadow: [
                  BoxShadow(
                    color: widget.color.withOpacity(0.5),
                    blurRadius: 2,
                    spreadRadius: 1,
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}