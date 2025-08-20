import 'package:flutter/material.dart';

class Customslider extends StatefulWidget {
  @override
  State<Customslider> createState() => _CustomsliderState();
}

class _CustomsliderState extends State<Customslider> {
  double value=17.0;

  @override
  Widget build(BuildContext context) {
    return SliderTheme(
      data: SliderThemeData(
        activeTrackColor: Colors.blueAccent,
        inactiveTrackColor: Colors.indigo,
        thumbColor: Colors.indigo,
        showValueIndicator: ShowValueIndicator.never,
      ),
      child: Column(
        children: [
          Slider(
                    value: value,
                    min: 0.0,
                    max:50.0,
                    divisions: 50,
                    label: '17',
                    activeColor: Colors.blue,
                    inactiveColor: Colors.grey[300],
                    onChanged: (value) => setState(()=>this.value=value),

                ),
          Container(
            child: Text(value.round().toString(),style: TextStyle(fontWeight: FontWeight.bold),),
          )
        ],
      ),
    );


  }
}
