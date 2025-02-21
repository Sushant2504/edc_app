import 'package:flutter/material.dart';

class ResponsiveImage extends StatelessWidget {
  final String imagePath;
  final BoxFit fit;
  final Widget Function(BuildContext, dynamic, StackTrace?)? errorBuilder;
  final Widget Function(BuildContext, Widget, ImageChunkEvent?)? loadingBuilder;

  const ResponsiveImage({
    super.key,
    required this.imagePath,
    this.fit = BoxFit.cover,
    this.errorBuilder,
    this.loadingBuilder,
  });

  @override
  Widget build(BuildContext context) {
    return Image.asset(
      imagePath,
      fit: fit,
      errorBuilder: errorBuilder ?? _defaultErrorBuilder,
      frameBuilder: (context, child, frame, wasSynchronouslyLoaded) {
        if (wasSynchronouslyLoaded) return child;
        return AnimatedOpacity(
          opacity: frame == null ? 0 : 1,
          duration: const Duration(milliseconds: 300),
          curve: Curves.easeOut,
          child: child,
        );
      },
    );
  }

  Widget _defaultErrorBuilder(BuildContext context, dynamic error, StackTrace? stackTrace) {
    return const Center(
      child: Icon(
        Icons.error_outline,
        size: 40,
        color: Colors.white,
      ),
    );
  }
}