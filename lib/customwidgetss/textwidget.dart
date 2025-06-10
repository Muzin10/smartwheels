import 'package:flutter/material.dart';

import '../main.dart';

class TextSW extends StatelessWidget {
  final String text;
  final double? fontSize;
  final Color color;
  final FontWeight fontWeight;

  const TextSW({
    required this.text,
    this.fontSize,
    this.color = Colors.black,
    this.fontWeight = FontWeight.bold,
  });

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: TextStyle(
        fontSize: fontSize??width*0.03,
        color: color,
        fontWeight: fontWeight,
      ),
    );
  }
}

