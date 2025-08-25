import 'package:flutter/material.dart';
import 'package:online_calculator_hub/utils/Constants/colors.dart';

class CheckBoxWidget extends StatelessWidget {
  final String title;
  final bool value;
  final ValueChanged<bool?>? onChanged;

  const CheckBoxWidget({
    super.key,
    required this.title,
    required this.value,
    this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 30,

      child: CheckboxListTile(
        contentPadding: EdgeInsets.zero,
        activeColor: AppColors.PrimaryColor,
        title: Text(title, softWrap: true),
        value: value,
        onChanged: onChanged,
        controlAffinity: ListTileControlAffinity.leading,
      ),
    );
  }
}
