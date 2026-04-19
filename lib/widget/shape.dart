import 'package:flutter/material.dart';

class Shape extends StatelessWidget {
  final String image;
  const Shape({super.key, required this.image});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: Colors.grey[200],
        borderRadius: BorderRadius.circular(20),
        border: Border.all(color: Colors.grey),
      ),
      child: Image.asset(image, width: 30,height: 30, fit: BoxFit.contain,),
    );
  }
}
