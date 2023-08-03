import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class DeptCard extends StatelessWidget {
  String image;
  String text;

   DeptCard({super.key,required this.image,required this.text});

  @override
  Widget build(BuildContext context) {
    return   Card(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          // Category image
          Image.asset(
            image,
            height: 140,
          ),
          SizedBox(height: 8.0),
          // Category name
          Text(text),
        ],
      ),
    );
  }
}
