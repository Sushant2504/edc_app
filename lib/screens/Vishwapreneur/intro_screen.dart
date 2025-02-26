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
      appBar: AppBar(
        title: Text("Vishwapreneur"),
        backgroundColor: Colors.blue, // Adjust color as per theme
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: MasonryGridView.builder(
          itemCount: 12,
          gridDelegate: const SliverSimpleGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 1,
          ),
          itemBuilder: (context, index) => Padding(
            padding: const EdgeInsets.all(8.0),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(12),
              child: Image.asset(
                'assets/images/vp$index.jpg',
                fit: BoxFit.cover,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
