import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:online_calculator_hub/screens/calories_calculator/calories_calculator_controller.dart';
import 'package:online_calculator_hub/utils/Constants/colors.dart';
import 'package:online_calculator_hub/widgets/custom_input_field.dart';
import 'package:online_calculator_hub/widgets/custom_info_drop_down.dart';
import 'package:online_calculator_hub/widgets/custom_text.dart';
import 'package:online_calculator_hub/widgets/custom_app_bar.dart';
import 'package:online_calculator_hub/widgets/custom_drop_down.dart';
import 'package:online_calculator_hub/widgets/custom_button.dart';

class CaloriesCalculatorView extends StatelessWidget {
  final CaloriesController calorieController = Get.put(CaloriesController());
  final String title;

  CaloriesCalculatorView({super.key, required this.title});

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
                onChanged: (value) => () {
                  if(value!=null){
                    calorieController.setSelectedGender(value);
                  }

                },
              ),
              CustomInputField(
                label: "Age",
                hintText: "30",
                keyboardType: TextInputType.numberWithOptions(),
                controller: calorieController.ageController,
              ),
              CustomInputField(
                label: "Weight (kg)",
                hintText: '70',
                keyboardType: TextInputType.numberWithOptions(),
                controller: calorieController.weightController,
              ),
              CustomInputField(
                label: "Height (cm)",
                hintText: '170',
                keyboardType: TextInputType.numberWithOptions(),
                controller: calorieController.heightController,
              ),
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
                onChanged: (value) {
                  calorieController.setSelectedActivity(value);
                },
              ),
              SizedBox(height: 5),
              CustomTextButton(
                text: "Calculate Calories",
                onPressed: () {
                  calorieController.calculateCalories();
                  Get.defaultDialog(
                    title: "Your Calories Burn",
                    titleStyle: TextStyle(fontWeight: FontWeight.bold,color: AppColors.PrimaryColor),

                    middleText:
                    "Calories: ${calorieController.calories.value} kcal\n\n"
                        "Gender: ${calorieController.selectedGender.value}\n"
                        "Age: ${calorieController.ageController.text} yrs\n"
                        "Weight: ${calorieController.weightController.text} kg\n"
                        "Height: ${calorieController.heightController.text} cm\n"
                        "Activity: ${calorieController.selectedActivity.value}",

                    confirm: SizedBox(
                      width: 70,
                      child: CustomTextButton(
                        text: "Ok",
                        onPressed: () => { calorieController.reset(),Get.back()},
                        buttonColor: AppColors.PrimaryColor,
                        size: 80,
                        textColor: Colors.white,
                      ),
                    ),
                  );
                },
                buttonColor: AppColors.PrimaryColor,
                textColor: Colors.white,
              ),
              Infodropdown(
                title: "How it's calculated?",
                details:
                    'Using the Mifflin-St Jeor Formula:\nMen: BMR = 10W + 6.25H - 5A + 5\nWomen: BMR = 10W + 6.25H - 5A - 161TDEE = BMR × Activity Factor',
              ),
            ],
          ),
        ),
      ),
    );
  }
}
