import 'package:flutter/material.dart';
import 'package:edc_app/models/article.dart';
import 'package:edc_app/widgets/article_screen.dart';
import 'package:edc_app/widgets/animated_background.dart';
import 'package:edc_app/widgets/article_card.dart';
class NewsletterScreen extends StatefulWidget {
    
    @override
    _NewsletterScreenState createState() => _NewsletterScreenState();
}

class _NewsletterScreenState extends State<NewsletterScreen> {
    
    @override
    Widget build(BuildContext context) {
        return Scaffold(
        backgroundColor: Colors.transparent,
        appBar: AppBar(
          title: const Text('Newsletter'),
          backgroundColor: Colors.transparent,
          elevation: 0,
        ),
        body: ListView.builder(
          padding: const EdgeInsets.all(16),
          itemCount: articles.length,
          itemBuilder: (context, index) {
            return Padding(
              padding: const EdgeInsets.only(bottom: 16),
              child: ArticleCard(
                article: articles[index],
                onLike: (id) {
                  // Implement like functionality
                },
                onTap: (id) {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => ArticleScreen(article: articles[index]),
                    ),
                  );
                },
              ),
            );
          },
        ),
      
    );
    }
}