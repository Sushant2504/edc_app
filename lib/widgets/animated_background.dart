import 'package:flutter/material.dart';
import 'package:edc_app/widgets/sparkle.dart';

class AnimatedBackground extends StatelessWidget {
  final Widget child;

  const AnimatedBackground({
    super.key,
    required this.child,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              colors: [
                const Color.fromARGB(255, 92, 51, 157)!,
                const Color.fromARGB(255, 36, 20, 74)!,
              ],
            ),
          ),
        ),
        // Add multiple sparkles with different sizes and positions
        for (int i = 0; i < 30; i++)
          Sparkle(
            size: (i % 3 + 2).toDouble(),
            color: Colors.white.withOpacity(0.6),
          ),
        child,
      ],
    );
  }
}