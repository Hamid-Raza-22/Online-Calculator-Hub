import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:online_calculator_hub/screens/calories_calculator/calories_calculator_controller.dart';
import 'package:online_calculator_hub/utils/Constants/colors.dart';
import 'package:online_calculator_hub/widgets/custom_input_field.dart';
import 'package:online_calculator_hub/widgets/custom_info_drop_down.dart';
import 'package:online_calculator_hub/widgets/custom_result_container.dart';
import 'package:online_calculator_hub/widgets/custom_text.dart';
import 'package:online_calculator_hub/widgets/custom_app_bar.dart';
import 'package:online_calculator_hub/widgets/custom_drop_down.dart';
import 'package:online_calculator_hub/widgets/custom_button.dart';

class CaloriesCalculatorView extends StatelessWidget {
  final CaloriesController calorieController = Get.put(CaloriesController());
  final String title;
  final _formKey = GlobalKey<FormState>();

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
          child: Form(
            key: _formKey,
            child: Column(
              spacing: 10,
              children: [
                TextWidget(
                  text:
                      "Calculate your daily calorie needs based on your age, gender, weight, height, and activity level.",
                  fontSize: 16,
                  weight: FontWeight.normal,
                ),
                Obx(
                  ()=> CustomDropdown(
                    label: "Gender",
                    value: calorieController.selectedGender.value,
                    items: ['Male', 'Female'],
                    onChanged: (value){
                      if (value != null) {
                        calorieController.setSelectedGender(value);
                        calorieController.clicked.value=false;
                        calorieController.showResult.value=false;
                      }
                    },
                  ),
                ),
                CustomInputField(
                  label: "Age",
                  hintText: "30",
                  isNumeric: true,
                  keyboardType: TextInputType.numberWithOptions(decimal: true),
                  controller: calorieController.ageController,
                ),
                CustomInputField(
                  label: "Weight (kg)",
                  hintText: '70',
                  isNumeric: true,
                  keyboardType: TextInputType.numberWithOptions(decimal: true),
                  controller: calorieController.weightController,
                ),
                CustomInputField(
                  label: "Height (cm)",
                  hintText: '170',
                  isNumeric: true,
                  keyboardType: TextInputType.numberWithOptions(decimal: true),
                  controller: calorieController.heightController,
                ),
                Obx(
                  ()=> CustomDropdown(
                    label: 'Activity Level',
                    value: calorieController.selectedActivity.value,
                    items: [
                      'Sedentary(little or no exercise)',
                      'Lightly active (1-3 days/week)',
                      'Moderately active (3-5 days/week)',
                      'Very active (6-7 days/week)',
                      'Extra active (Physical job)',
                    ],
                    onChanged: (value) {
                      calorieController.setSelectedActivity(value);
                      calorieController.clicked.value=false;
                      calorieController.showResult.value=false;
                    },
                  ),
                ),
                SizedBox(height: 5),
                Obx(
                  ()=> CustomTextButton(
                    text: calorieController.clicked.value ? "Calculated":"Calculate Calories",
                    onPressed: () {
                      if (_formKey.currentState!.validate()) {
                        calorieController.calculateCalories();
                        FocusScope.of(context).unfocus();
                        calorieController.showResult.value =true;
                        calorieController.clicked.value=true;
                      }
                    },
                    buttonColor: calorieController.clicked.value ? Colors.green:AppColors.PrimaryColor,
                    textColor: Colors.white,
                  ),
                ),
                Obx(
                  (){
                    if(calorieController.showResult.value) {
                      return CustomResultContainer(
                      title: "Calories",
                      text1:
                      "Maintain Calories: ${calorieController.calories.value}",
                      text2:
                      "Gain Weight (0.5kg/week):  ${calorieController.gainCalories.value} cal/day",
                      text3:
                      "Lose Weight (0.5kg/week):  ${calorieController.loseCalories.value} cal/day",
                      text4:  "BMR(Basal Metabolic Rate):  ${calorieController.bmr.value} cal/day",
                      clipboardText: "Copy to Clipboard",
                      resetText: "Reset",
                      clipBoardFunction: (){
                        calorieController.copyResult();
                      },
                      reset: (){
                        calorieController.reset();
                      },
                    );
                    }
                    return SizedBox.shrink();
                  }

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
      ),
    );
  }
}
