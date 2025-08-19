import 'package:flutter/material.dart';

class Customslider extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Slider(
              value: 17.0,
              min: 0.0,
              max: 100.0,
              divisions: 100,
              label: '17',
              activeColor: Colors.blue,
              inactiveColor: Colors.grey[300],
              onChanged: (value) {},

          );


  }
}
