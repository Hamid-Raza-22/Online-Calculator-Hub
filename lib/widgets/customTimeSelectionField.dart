import 'package:flutter/material.dart';


class Customtimeselectionfield extends StatefulWidget {
  final String label;

  const Customtimeselectionfield({
    Key? key,
    required this.label,
  }) : super(key: key);

  @override
  State<Customtimeselectionfield> createState() => _SimpleTimeFieldState();
}

class _SimpleTimeFieldState extends State<Customtimeselectionfield> {
  Future<void> _pickTime() async {
    TimeOfDay? picked = await showTimePicker(
      context: context,
      initialTime: TimeOfDay.now(),
    );

    if (picked != null) {
      final now = DateTime.now();
      // final dt = DateTime(now.year, now.month, now.day, picked.hour, picked.minute);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(widget.label,
            style: TextStyle(fontSize: 14, fontWeight: FontWeight.w500)),
        SizedBox(height: 5),
        TextField(
          keyboardType: TextInputType.datetime,
          decoration: InputDecoration(
            hintText: '12:00 am',
            hintStyle: TextStyle(color: Colors.grey),
            border: OutlineInputBorder(borderRadius: BorderRadius.circular(8)),
            suffixIcon: IconButton(
              icon: Icon(Icons.access_time),
              onPressed: _pickTime,
            ),
          ),
        ),
      ],
    );
  }
}
