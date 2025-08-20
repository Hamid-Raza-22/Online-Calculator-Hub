import 'package:flutter/material.dart';
import 'package:online_calculator_hub/utils/Constants/colors.dart';
import 'package:online_calculator_hub/widgets/custom_input_field.dart';
import 'package:online_calculator_hub/widgets/custom_info_drop_down.dart';
import 'package:online_calculator_hub/widgets/custom_text.dart';
import 'package:online_calculator_hub/widgets/custom_app_bar.dart';
import 'package:online_calculator_hub/widgets/custom_drop_down.dart';
import 'package:online_calculator_hub/widgets/custom_button.dart';

class CaloriesCalculatorView extends StatelessWidget {
  final String title;

  const CaloriesCalculatorView({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        bgColor: AppColors.PrimaryColor,
        iconColor: Colors.white,
        title: title,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            spacing: 10,
            children: [
              TextWidget(
                text:
                    "Calculate your daily calorie needs based on your age, gender, weight, height, and activity level.",
                fontSize: 16,
                weight: FontWeight.normal,
              ),
              CustomDropdown(
                label: "Gender",
                value: 'Male',
                items: ['Male', 'Female', 'other'],
                onChanged: (value) => () {},
              ),
              CustomInputField(label: "Age", hintText: "30"),
              CustomInputField(label: "Weight (kg)", hintText: '70'),
              CustomInputField(label: "Height (cm)", hintText: '170'),
              CustomDropdown(
                label: 'Activity Level',
                value: 'Sedentary(little or no exercise)',
                items: [
                  'Sedentary(little or no exercise)',
                  'Lightly active (1-3 days/week)',
                  'Moderately active (3-5 days/week)',
                  'Very active (6-7 days/week)',
                  'Extra active (Physical job)',
                ],
                onChanged: (value) => () {},
              ),
              SizedBox(height: 5,),
              CustomTextButton(text: "Calculate Calories", onPressed: (){}, buttonColor: AppColors.PrimaryColor,textColor: Colors.white,),
              Infodropdown(title: "How it's calculated?", details:'Using the Mifflin-St Jeor Formula:\nMen: BMR = 10W + 6.25H - 5A + 5\nWomen: BMR = 10W + 6.25H - 5A - 161TDEE = BMR × Activity Factor')
            ],
          ),
        ),
      ),
    );
  }
}
