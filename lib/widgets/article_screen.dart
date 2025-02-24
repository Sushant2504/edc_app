import 'package:flutter/material.dart';
import 'package:edc_app/models/article.dart';
import 'package:edc_app/widgets/animated_background.dart';
import 'package:edc_app/widgets/article_content.dart';
import 'package:edc_app/widgets/article_header.dart';
import 'package:edc_app/widgets/comment_section.dart';



class ArticleScreen extends StatelessWidget {
  final Article article;

  const ArticleScreen({
    super.key,
    required this.article,
  });

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;
    final imageHeight = (screenSize.height * 0.35).clamp(200.0, 400.0);

    return Scaffold(
      body: AnimatedBackground(
        child: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              colors: [
                Colors.deepPurple[700]!,
                Colors.deepPurple[900]!,
              ],
            ),
          ),
          child: SafeArea(
            child: CustomScrollView(
              slivers: [
                ArticleHeader(
                  article: article,
                  expandedHeight: imageHeight,
                ),
                SliverToBoxAdapter(
                  child: Padding(
                    padding: EdgeInsets.symmetric(
                      horizontal: screenSize.width * 0.05,
                      vertical: 16,
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        ArticleContent(
                          content: article.content,
                          author: article.author,
                          publishedAt: article.publishedAt,
                        ),
                        const SizedBox(height: 24),
                        const CommentSection(),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}