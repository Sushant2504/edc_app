import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:navigation_design/widgets/gradient_container.dart';

class ArticleContent extends StatelessWidget {
  final String content;
  final String author;
  final DateTime publishedAt;

  const ArticleContent({
    super.key,
    required this.content,
    required this.author,
    required this.publishedAt,
  });

  @override
  Widget build(BuildContext context) {
    return GradientContainer(
      child: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'By $author • ${DateFormat('MMM d, yyyy').format(publishedAt)}',
              style: Theme.of(context).textTheme.bodySmall?.copyWith(
                color: Colors.grey[600],
              ),
            ),
            const SizedBox(height: 16),
            Text(
              content,
              style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                color: Colors.black87,
                height: 1.6,
              ),
            ),
          ],
        ),
      ),
    );
  }
}