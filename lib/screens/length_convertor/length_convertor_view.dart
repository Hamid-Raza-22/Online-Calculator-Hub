import 'package:flutter/material.dart';
import 'package:online_calculator_hub/utils/Constants/colors.dart';
import 'package:online_calculator_hub/widgets/custom_input_field.dart';
import 'package:online_calculator_hub/widgets/custom_app_bar.dart';
import 'package:online_calculator_hub/widgets/custom_drop_down.dart';
import 'package:online_calculator_hub/widgets/custom_button.dart';

class LengthConvertorView extends StatelessWidget {
  final String title;

  const LengthConvertorView({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        bgColor: AppColors.PrimaryColor,
        iconColor: Colors.white,
        title: title,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          spacing: 10,
          children: [
            CustomInputField(label: "Value", hintText: '1'),
            CustomDropdown(
              label: "From",
              value: 'Meter(m)',
              items: [
                'Meter(m)',
                'Kilometer(km)',
                'centimeter(cm)',
                'Milieter(mm)',
                'Mile',
                'Yard',
                'Foot',
                'Inch',
              ],
              onChanged: (value) => () {},
            ),
            CustomDropdown(
              label: "To",
              value: 'Foot',
              items: [
                'Meter(m)',
                'Kilometer(km)',
                'centimeter(cm)',
                'Milieter(mm)',
                'Mile',
                'Yard',
                'Foot',
                'Inch',
              ],
              onChanged: (value) => () {},
            ),
            CustomTextButton(text: "Convert", onPressed: (){}, buttonColor: AppColors.PrimaryColor,textColor: Colors.white,)
          ],
        ),
      ),
    );
  }
}
