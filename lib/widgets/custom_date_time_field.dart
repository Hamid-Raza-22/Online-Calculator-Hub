import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class CustomDateField extends StatefulWidget {
  final String label;
  final ValueChanged<DateTime?>? onChanged;

  const CustomDateField({
    Key? key,
    required this.label,
    this.onChanged,
  }) : super(key: key);

  @override
  _CustomDatePickerFieldState createState() => _CustomDatePickerFieldState();
}

class _CustomDatePickerFieldState extends State<CustomDateField> {
  DateTime? selectedDate;
  final TextEditingController _controller = TextEditingController();

  Future<void> _selectDate(BuildContext context) async {
    DateTime? picked = await showDatePicker(
      context: context,
      initialDate: selectedDate ?? DateTime.now(),
      firstDate: DateTime(1900),
      lastDate: DateTime(2100),
    );

    if (picked != null) {
      setState(() {
        selectedDate = picked;
        _controller.text = DateFormat("yyyy-MM-dd").format(picked);
      });
      widget.onChanged?.call(picked); // safe call
    }
  }

  String? _validator(String? value) {
    if (value == null || value.isEmpty) {
      return "Please select a date";
    }
    try {
      DateFormat("yyyy-MM-dd").parseStrict(value);
    } catch (_) {
      return "Invalid date format (use yyyy-MM-dd)";
    }
    return null;
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(widget.label,
            style: TextStyle(fontSize: 14, fontWeight: FontWeight.w500)),
        SizedBox(height: 5),
        TextFormField(
          controller: _controller,
          cursorColor: Colors.black,
          validator: _validator,
          decoration: InputDecoration(
            hintText: 'yyyy-MM-dd',
            hintStyle: TextStyle(color: Colors.grey),
            focusedBorder: OutlineInputBorder(
                borderSide: BorderSide(color: Colors.black)),
            border: OutlineInputBorder(borderRadius: BorderRadius.circular(8)),
            suffixIcon: IconButton(
              icon: Icon(Icons.calendar_today),
              onPressed: () => _selectDate(context),
            ),
          ),
          onChanged: (value) {
            try {
              final parsedDate =
              DateFormat("yyyy-MM-dd").parseStrict(value.trim());
              setState(() {
                selectedDate = parsedDate;
              });
              widget.onChanged?.call(parsedDate);
            } catch (_) {
              // if not valid, do nothing until user corrects it
            }
          },
        ),
      ],
    );
  }
}
