import 'package:flutter/material.dart';

class CustomInputField extends StatelessWidget {
  final String label;
  final String hintText;
  final TextInputType keyboardType;
  final TextEditingController? controller;

  const CustomInputField({
    super.key,
    required this.label,
    required this.hintText,
    this.keyboardType = TextInputType.text,
    this.controller,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(label,
            style: TextStyle(fontSize: 14, fontWeight: FontWeight.w500)),
        SizedBox(height: 5),
        TextFormField(
          controller: controller,
          cursorColor: Colors.black,
          validator: (value) {
            if (value == null || value.trim().isEmpty) {
              return "Please fill this field";
            }
            return null;
          },
          keyboardType: keyboardType,
          decoration: InputDecoration(
            hintText: hintText,
            hintStyle: TextStyle(color: Colors.grey),
            focusedBorder: OutlineInputBorder(
              borderSide: BorderSide(color: Colors.black, width: 2),
            ),
            border: OutlineInputBorder(
              borderSide: BorderSide(color: Colors.black),
              borderRadius: BorderRadius.circular(8),
            ),
            contentPadding:
            EdgeInsets.symmetric(horizontal: 12, vertical: 10),
          ),
        ),
      ],
    );
  }
}
