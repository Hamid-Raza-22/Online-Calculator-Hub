import 'package:flutter/material.dart';

class BottomElevatedCard extends StatelessWidget {
  const BottomElevatedCard({
    super.key,
    required this.text,
    required this.onTap,
    this.backgroundColor = Colors.black38,
    this.borderRadius = 12,this.C_icon,
  });

  final String text;
  final VoidCallback onTap;
  final C_icon;
  final Color backgroundColor;
  final double borderRadius;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 100,
      width: 100,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(borderRadius),
        // bottom-only elevation look
        boxShadow: const [
          BoxShadow(
            color: Colors.black26,
            offset: Offset(0, 6), // pushes shadow downward
            blurRadius: 14,
            spreadRadius: 0,
          ),
        ],
      ),
      child: Material(
        color: backgroundColor,
        borderRadius: BorderRadius.circular(borderRadius),
        child: InkWell(
          borderRadius: BorderRadius.circular(borderRadius),
          onTap: onTap,
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 5),
            child:Column(
              spacing: 4,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(C_icon,color: Colors.white,),
                Text(
                  text,
                  softWrap: true,
                  textAlign: TextAlign.center,
                  overflow: TextOverflow.visible,
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                    color: Colors.white
                  ),
                ),
              ],
            )
          ),
        ),
      ),
    );
  }
}
