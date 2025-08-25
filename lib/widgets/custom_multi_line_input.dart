import 'package:flutter/material.dart';

class CustomMultiLineField extends StatelessWidget {
  final String label;
  final String hint;
  final bool enabled;
  final TextEditingController? controller;

  const CustomMultiLineField({
    Key? key,

    required this.label,
    required this.hint, this.controller, this.enabled=true,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: TextStyle(
            fontSize: 14,
            fontWeight: FontWeight.w600,
            color: Colors.black87,
          ),
        ),
        const SizedBox(height: 6),
        TextFormField(
          enabled: enabled,
          maxLines: 6,
          minLines: 4,
          controller: controller,
          keyboardType: TextInputType.multiline,
          validator: (value) {
            if (value == null || value.trim().isEmpty) {
              return "Please fill this field";
            }
            return null;
          },
          decoration: InputDecoration(
            hintText: hint,
            hintStyle: TextStyle(color: Colors.grey.shade500),
            contentPadding: const EdgeInsets.all(12),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(6),
              borderSide: BorderSide(color: Colors.grey.shade400),
            ),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(6),
              borderSide: BorderSide(color: Colors.grey.shade400),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(6),
              borderSide: const BorderSide(color: Colors.blue, width: 1.5),
            ),
          ),
        ),
      ],
    );
  }
}
