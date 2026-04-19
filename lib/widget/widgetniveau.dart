import 'package:flutter/material.dart';

class Widgetniveau extends StatelessWidget {
  final Color color;
  final String text;
  final String image;
  final VoidCallback onTap;

  const Widgetniveau({super.key , required this.color, required this.text,  required this.image,required this.onTap});


  @override
  Widget build(BuildContext context) {
    return Container(
        padding: EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: color,
          borderRadius: BorderRadius.circular(20),
        ),
        child: Row(
            children: [
              Image.asset(image),
              const SizedBox(width: 10),
              Text(text, style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 20, color: Colors.white)),
            ]
        )
    );
  }
}
