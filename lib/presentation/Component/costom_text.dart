import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CostomText extends StatelessWidget {
  String title;
  Color color;
   CostomText({super.key,required this.title,required this.color});

  @override
  Widget build(BuildContext context) {
    return Text(
      title,
      style: TextStyle(
          fontWeight: FontWeight.bold,
          fontSize: 30,
          color: color),
    );
  }
}
