import 'package:flutter/cupertino.dart';

class ToolItem {
  final String title;
  final IconData icon;
  final Function() onTap;

  ToolItem({required this.title, required this.icon, required this.onTap});
}