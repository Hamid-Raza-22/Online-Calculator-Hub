import 'package:flutter/material.dart';


class Customtimeselectionfield extends StatefulWidget {
  final String label;
  final ValueChanged<TimeOfDay?>? onChanged;

  const Customtimeselectionfield({
    Key? key,
    required this.label,
    this.onChanged,
  }) : super(key: key);

  @override
  State<Customtimeselectionfield> createState() => _SimpleTimeFieldState();
}

class _SimpleTimeFieldState extends State<Customtimeselectionfield> {
  TimeOfDay? selectedTime;
  final TextEditingController _controller = TextEditingController();

  Future<void> _pickTime() async {
    TimeOfDay? picked = await showTimePicker(
      context: context,
      initialTime: selectedTime ?? TimeOfDay.now(),
    );

    if (picked != null) {
      setState(() {
        selectedTime = picked;
        _controller.text = picked.format(context);
      });
      widget.onChanged?.call(picked); // ✅ send time back
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
          controller: _controller,
          readOnly: true,
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

