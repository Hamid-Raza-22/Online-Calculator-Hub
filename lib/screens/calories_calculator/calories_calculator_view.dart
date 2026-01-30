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
import 'package:url_launcher/url_launcher.dart';

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
                SizedBox(height: 20),
                Container(
                  padding: EdgeInsets.all(12),
                  decoration: BoxDecoration(
                    color: Colors.blue.shade50,
                    borderRadius: BorderRadius.circular(8),
                    border: Border.all(color: Colors.blue.shade200),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      TextWidget(
                        text: "Medical Citations & Sources",
                        fontSize: 18,
                        weight: FontWeight.bold,
                        textcolor: AppColors.PrimaryColor,
                      ),
                      SizedBox(height: 8),
                      TextWidget(
                        text: "The calorie calculations are based on established medical formulas and guidelines from:",
                        fontSize: 14,
                        weight: FontWeight.normal,
                        textcolor: Colors.grey.shade700,
                        align: TextAlign.start,
                      ),
                      SizedBox(height: 8),
                      _buildCitationLink(
                        "Mifflin-St Jeor Equation Research",
                        "https://www.ncbi.nlm.nih.gov/pmc/articles/PMC2291081/",
                      ),
                      _buildCitationLink(
                        "Academy of Nutrition and Dietetics",
                        "https://www.eatrightpro.org/practice/practice-resources/medical-nutrition-therapy/estimated-energy-needs",
                      ),
                      _buildCitationLink(
                        "Dietary Guidelines for Americans",
                        "https://www.dietaryguidelines.gov/sites/default/files/2021-03/Dietary_Guidelines_for_Americans-2020-2025.pdf",
                      ),
                      SizedBox(height: 8),
                      TextWidget(
                        text: "Note: These calculations provide estimates. Individual calorie needs may vary. Consult with a registered dietitian or healthcare professional for personalized nutrition advice.",
                        fontSize: 12,
                        weight: FontWeight.normal,
                        textcolor: Colors.grey.shade600,
                        align: TextAlign.start,
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildCitationLink(String text, String url) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4.0),
      child: InkWell(
        onTap: () async {
          final uri = Uri.parse(url);
          if (await canLaunchUrl(uri)) {
            await launchUrl(uri, mode: LaunchMode.externalApplication);
          }
        },
        child: Row(
          children: [
            Icon(Icons.link, size: 16, color: Colors.blue.shade700),
            SizedBox(width: 6),
            Expanded(
              child: Text(
                text,
                style: TextStyle(
                  fontSize: 14,
                  color: Colors.blue.shade700,
                  decoration: TextDecoration.underline,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
