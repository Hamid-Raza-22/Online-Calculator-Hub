import 'package:flutter/material.dart';

class TextWidget extends StatelessWidget {
  final String text;
  final double fontSize;
  final FontWeight weight;
  const TextWidget({super.key, required this.text, required this.fontSize, required this.weight});

  @override
  Widget build(BuildContext context) {
    return Text(
      softWrap: true,
      text,
      style: TextStyle(
        fontWeight: weight,
        fontSize:fontSize,
        color: Colors.black
      ),
    );
  }
}
