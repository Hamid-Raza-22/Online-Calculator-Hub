import 'package:flutter/material.dart';
import 'package:online_calculator_hub/utils/Constants/colors.dart';
import 'package:online_calculator_hub/widgets/CustomInputFeild.dart';
import 'package:online_calculator_hub/widgets/customAppBar.dart';
import 'package:online_calculator_hub/widgets/customDropdown.dart';
import 'package:online_calculator_hub/widgets/custom_button.dart';

class WeightConvertorView extends StatelessWidget {
  final String title;

  const WeightConvertorView({super.key, required this.title});

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
              value: 'Kilogram(kg)',
              items: [
                'Kilogram(kg)',
                'Gram(g)',
                'Milligram(mg)',
                'Pound(Ib)',
                'Metric Ton',
                'Stone',
                'Ounce(oz)'
              ],
              onChanged: (value) => () {},
            ),
            CustomDropdown(
              label: "To",
              value: 'Pound(Ib)',
              items: [
                'Kilogram(kg)',
                'Gram(g)',
                'Milligram(mg)',
                'Pound(Ib)',
                'Metric Ton',
                'Stone',
                'Ounce(oz)'
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
