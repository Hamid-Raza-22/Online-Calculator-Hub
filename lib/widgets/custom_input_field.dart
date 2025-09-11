import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class CustomInputField extends StatelessWidget {
  final String label;
  final String hintText;
  final TextInputType keyboardType;
  final TextEditingController? controller;
  final bool isNumeric;

  const CustomInputField({
    super.key,
    required this.label,
    required this.hintText,
    this.keyboardType = TextInputType.text,
    this.controller,
    this.isNumeric = false,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: const TextStyle(fontSize: 14, fontWeight: FontWeight.w500),
        ),
        const SizedBox(height: 5),
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
            hintStyle: const TextStyle(color: Colors.grey),
            focusedBorder: const OutlineInputBorder(
              borderSide: BorderSide(color: Colors.black, width: 2),
            ),
            border: OutlineInputBorder(
              borderSide: const BorderSide(color: Colors.black),
              borderRadius: BorderRadius.circular(8),
            ),
            contentPadding: const EdgeInsets.symmetric(horizontal: 12, vertical: 10),
          ),
          inputFormatters: isNumeric
              ? [
            FilteringTextInputFormatter.allow(RegExp(r'[0-9.]')),
            TextInputFormatter.withFunction((oldValue, newValue) {
              final text = newValue.text;

              // allow only one dot
              if (text.contains('.') &&
                  text.indexOf('.') != text.lastIndexOf('.')) {
                return oldValue;
              }

              // block invalid formats
              if (!RegExp(r'^\d*\.?\d*$').hasMatch(text)) {
                return oldValue;
              }

              return newValue;
            }),
          ]
              : [],
        ),
      ],
    );
  }
}
