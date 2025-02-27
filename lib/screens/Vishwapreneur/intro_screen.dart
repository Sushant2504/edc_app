import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';

class VPScreen extends StatefulWidget {
  @override
  _VPScreenState createState() => _VPScreenState();
}

class _VPScreenState extends State<VPScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true, // Makes AppBar transparent over BG
      appBar: AppBar(
        title: Text(
          "Vishwapreneur",
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 24,
            letterSpacing: 1.2,
          ),
        ),
        centerTitle: true,
        elevation: 0,
        backgroundColor: Colors.black.withOpacity(1),
      ),
      body: Stack(
        children: [
          // Background with Gradient Overlay
          Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage('assets/images/rocket-bg.png'),
                fit: BoxFit.cover,
              ),
            ),
            child: Container(
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: [
                    Colors.black.withOpacity(0.6),
                    Colors.transparent,
                    Colors.black.withOpacity(0.6),
                  ],
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                ),
              ),
            ),
          ),

          // Grid Content with Glassmorphic Effect
          Padding(
            padding: const EdgeInsets.only(top: 100, left: 10, right: 10, bottom: 20),
            child: MasonryGridView.builder(
              physics: BouncingScrollPhysics(), // Smooth scrolling
              itemCount: 12,
              gridDelegate: SliverSimpleGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 1, // 2-column layout for better aesthetics
              ),
              itemBuilder: (context, index) => Padding(
                padding: const EdgeInsets.all(8.0),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(18),
                  child: Stack(
                    children: [
                      // Image with Shadow
                      Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(18),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.black.withOpacity(0.3),
                              blurRadius: 10,
                              spreadRadius: 2,
                              offset: Offset(3, 5),
                            ),
                          ],
                        ),
                        child: Image.asset(
                          'assets/images/vp$index.jpg',
                          fit: BoxFit.cover,
                        ),
                      ),

                      // Glassmorphic Effect
                      Positioned.fill(
                        child: Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(18),
                            color: Colors.white.withOpacity(0.1),
                            border: Border.all(color: Colors.white.withOpacity(0.2), width: 1),
                            boxShadow: [
                              BoxShadow(
                                color: Colors.black.withOpacity(0.2),
                                blurRadius: 30,
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
