import 'package:flutter/material.dart';

class CustomSearchField extends StatelessWidget {
  final IconData? icon;
  final String hintText;
 final String? labelText;

  const CustomSearchField(
      {super.key,
       this.icon,
        required this.hintText,
       this.labelText,
      });

  @override
  Widget build(BuildContext context) {
    final border = OutlineInputBorder(
      borderRadius: BorderRadius.circular(12),
      borderSide: const BorderSide(color: Color(0xFFBDBDBD)),
    );

    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8),
      child: TextFormField(

        decoration: InputDecoration(
          prefixIcon: Icon(icon, color: Color(0xFFBDBDBD)),
          hintText: hintText,
          labelText: labelText,
          hintStyle: const TextStyle(color: Color(0xFF757575)),
          border: border,
          enabledBorder: border,
          focusedBorder: border,
        ),
      ),
    );
  }
}