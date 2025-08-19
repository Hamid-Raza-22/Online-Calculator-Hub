import 'package:flutter/material.dart';

class TextWidget extends StatelessWidget {
  final String text;
  final Color textcolor;
  final double fontSize;
  final FontWeight weight;


  const TextWidget({
    super.key,
    required this.text,
    required this.fontSize,
    required this.weight,
    this.textcolor=Colors.black,
  });

  @override
  Widget build(BuildContext context) {
    return Text(
      textAlign:TextAlign.center,
      softWrap: true,
      text,
      style: TextStyle(
        fontWeight: weight,
        fontSize: fontSize,
        color: textcolor,
      ),
    );
  }
}
