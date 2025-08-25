import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:online_calculator_hub/screens/age_calculator/age_calculator_controller.dart';
import 'package:online_calculator_hub/utils/Constants/colors.dart';
import 'package:online_calculator_hub/widgets/custom_date_time_field.dart';
import 'package:online_calculator_hub/widgets/custom_text.dart';
import 'package:online_calculator_hub/widgets/custom_app_bar.dart';
import 'package:online_calculator_hub/widgets/custom_button.dart';

class AgeCalculatorView extends StatelessWidget {
  final _formKey = GlobalKey<FormState>();
  final String title;
  final AgeController ageController = Get.put(AgeController());

  AgeCalculatorView({super.key, required this.title});

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
                  "Calculate your exact age in years, months, days, hours, and minutes.",
                  fontSize: 16,
                  weight: FontWeight.normal,
                  textcolor: Colors.grey,
                ),
                CustomDateField(
                  label: "Date of Birth",
                  onChanged: (date) {
                    ageController.setDob(date!);
                  },
                ),
                CustomDateField(
                  label: "Calculate Age On",
                  onChanged: (date) {
                    ageController.setCalculateOn(date!);
                  },
                ),
                CustomTextButton(
                  text: "Calculate Age",
                  onPressed: () {
                    if (_formKey.currentState!.validate()) {
                      ageController.calculateAge();
                      ageController.showResult.value = true;
                    }
                  },
                  buttonColor: AppColors.PrimaryColor,
                  textColor: Colors.white,
                ),
                CustomTextButton(
                  text: "Reset",
                  onPressed: () {
                    ageController.reset();
                    ageController.showResult.value = false; // hide container
                  },
                  buttonColor: Colors.grey,
                  textColor: Colors.white,
                ),


                Obx(() {
                  if (ageController.showResult.value) {
                    return Container(
                      width: 350,
                      margin: const EdgeInsets.only(top: 20),
                      padding: const EdgeInsets.all(16),
                      decoration: BoxDecoration(
                        color: Colors.grey.shade200,
                        borderRadius: BorderRadius.circular(12),
                        border: Border.all(color: AppColors.PrimaryColor),
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Your Age:",
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 18,
                              color: AppColors.PrimaryColor,
                            ),
                          ),
                          const SizedBox(height: 8),
                          Text("Years: ${ageController.years}"),
                          Text("Months: ${ageController.months}"),
                          Text("Days: ${ageController.days}"),
                        ],
                      ),
                    );
                  }
                  return SizedBox.shrink();
                }),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
