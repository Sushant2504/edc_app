import 'package:flutter/material.dart';
import 'package:edc_app/models/article.dart';
import 'package:edc_app/widgets/article_screen.dart';
import 'package:edc_app/widgets/article_card.dart';

class NewsletterScreen extends StatefulWidget {
  @override
  _NewsletterScreenState createState() => _NewsletterScreenState();
}

class _NewsletterScreenState extends State<NewsletterScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true, // Makes AppBar transparent over BG
      appBar: AppBar(
        title: const Text(
          'Newsletter',
          style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold, letterSpacing: 1.2),
        ),
        centerTitle: true,
        elevation: 0,
        backgroundColor: Colors.transparent,
        flexibleSpace: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [Colors.deepPurple.shade700, Colors.purple.shade400],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
          ),
        ),
      ),
      body: Stack(
        children: [
          // Background Image with Overlay
          Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage('assets/images/rocket-bg.png'),
                fit: BoxFit.cover,
                colorFilter: ColorFilter.mode(
                  Colors.white.withOpacity(0.9), // Adjust opacity as needed
                  BlendMode.dstATop,
                ),
              ),
            ),
          ),

          // Article List with Glassmorphic Cards
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 80),
            child: ListView.builder(
              itemCount: articles.length,
              itemBuilder: (context, index) {
                return Padding(
                  padding: const EdgeInsets.only(bottom: 16),
                  child: GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => ArticleScreen(article: articles[index]),
                        ),
                      );
                    },
                    child: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        color: Colors.white.withOpacity(0.1),
                        border: Border.all(color: Colors.white.withOpacity(0.2), width: 1),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black.withOpacity(0.2),
                            blurRadius: 10,
                            spreadRadius: 2,
                          ),
                        ],
                      ),
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
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
