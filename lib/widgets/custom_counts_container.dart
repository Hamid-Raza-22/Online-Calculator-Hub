import 'package:flutter/material.dart';



class Customcountscontainer extends StatelessWidget {
  final int count;
  final String text;
  final Color count_color;


  const Customcountscontainer({super.key, required this.count, required this.text, required this.count_color});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(


        height: 70,
        width: 90,
        color: Colors.transparent,

        child: Column(
          spacing: 5,
          children: [
            Text('$count',style: TextStyle(color: count_color),softWrap: true,),
            Text(text)
          ],
        ),

      ),
    );
  }
}
