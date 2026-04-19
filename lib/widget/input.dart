import 'package:flutter/material.dart';

class Input extends StatelessWidget {
  final String label;
  final String info;
  const Input({super.key, required this.label, required this.info});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 10),
      child: TextFormField(
        style: TextStyle(fontSize: 10),
        decoration: InputDecoration(
          label: Text(label),
          hintText: info,
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(20)),
        ),
        validator: (value) {
          if (value == null || value.isEmpty) {
            return 'veuillez saisir votre $label';
          }
          return null;
        },
      ),
    );
  }
}
