import 'package:flutter/material.dart';



class Customcountscontainer extends StatelessWidget {
  final String count;
  final String text;
  final Color countColor;


  const Customcountscontainer({super.key, required this.count, required this.text, required this.countColor});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(


        height: 70,
        width: 90,
        color: Colors.transparent,

        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          spacing: 5,
          children: [
            Text(count,style: TextStyle(color: countColor),softWrap: true,),
            Text(text,textAlign: TextAlign.center,style: TextStyle(fontWeight: FontWeight.w600),)
          ],
        ),

      ),
    );
  }
}
