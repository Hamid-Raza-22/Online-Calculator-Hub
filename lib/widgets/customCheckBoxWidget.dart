
import 'package:flutter/material.dart';

class CheckBoxWidget extends StatefulWidget {

  final String title;

  const CheckBoxWidget({super.key, required this.title});
  @override
  _CheckBoxExampleState createState() => _CheckBoxExampleState();
}

class _CheckBoxExampleState extends State<CheckBoxWidget> {
  bool isChecked = false;

  @override
  Widget build(BuildContext context) {
    return CheckboxListTile(
          title: Text(widget.title),
          value: isChecked,
          onChanged: (bool? value) {
            setState(() {
              isChecked = value ?? false;
            });
          },
          controlAffinity: ListTileControlAffinity.leading,
    );
  }
}
