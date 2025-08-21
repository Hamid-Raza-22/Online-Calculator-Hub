import 'package:flutter/material.dart';


class Infodropdown extends StatefulWidget {
  final String title;
  final String details;

  const Infodropdown({super.key, required this.title, required this.details});

  @override
  _ExpandableInfoState createState() => _ExpandableInfoState();
}

class _ExpandableInfoState extends State<Infodropdown> {
  bool expanded = false;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ListTile(
          title: Text(widget.title, style: TextStyle(fontWeight: FontWeight.bold)),
          leading: Transform.rotate(
          angle: expanded ? -90 * 3.1416 / 180: 0,
    child: Icon(Icons.play_arrow, size: 28),
    ),
          onTap: () => setState(() => expanded = !expanded),
        ),
        if (expanded)
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(widget.details, style: TextStyle(fontSize: 14)),
          ),
      ],
    );
  }
}
