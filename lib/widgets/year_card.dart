import 'package:edc_app/utils/ui/app_styles.dart';
import 'package:edc_app/utils/ui/app_theme.dart';
import 'package:flutter/material.dart';

class YearCard extends StatelessWidget {
  final int year;

  YearCard({required this.year});

  @override
  Widget build(BuildContext context) {

    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    return Container(
      margin: EdgeInsets.only(left: 50, top: 30, bottom: 30, right: 8),
      height: height * 0.04,
      width: width * 0.01,
      decoration: Appthemes.kyearCard,
      child: Center(
        child: Text(
            '$year',
            style: AppStyles.ksubtitleStyle,
          ),
      ),
      
    );
  }
}
