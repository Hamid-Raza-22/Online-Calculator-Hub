import 'package:flutter/material.dart';
import 'custom_text.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  final Color bgColor;
  final Color iconColor;
  final String title;
  final Color titleColor;
  final bool centerTitle;
  final List<Widget>? actions;

  const CustomAppBar({
    super.key,
    required this.bgColor,
    required this.iconColor,
    required this.title,
    this.titleColor = Colors.white,
    this.centerTitle = false,
    this.actions,
  });

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: bgColor,
      iconTheme: IconThemeData(color: iconColor),
      title: TextWidget(
        text: title,
        weight: FontWeight.bold,
        fontSize: 22,
        textcolor: titleColor,
      ),
      centerTitle: centerTitle,
      actions: actions,
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
