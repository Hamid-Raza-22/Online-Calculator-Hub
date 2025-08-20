import 'package:flutter/material.dart';

class TextWidget extends StatelessWidget {
  final String text;
  final Color textcolor;
  final double fontSize;
  final TextAlign align;
  final FontWeight weight;


  const TextWidget({
    super.key,
    required this.text,
    required this.fontSize,
    required this.weight,
    this.textcolor=Colors.black,  this.align=TextAlign.center,
  });

  @override
  Widget build(BuildContext context) {
    return Text(
      textAlign:align,
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
