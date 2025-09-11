import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:online_calculator_hub/screens/water_intake/water_intake_controller.dart';
import 'package:online_calculator_hub/utils/Constants/colors.dart';
import 'package:online_calculator_hub/widgets/custom_input_field.dart';
import 'package:online_calculator_hub/widgets/custom_app_bar.dart';
import 'package:online_calculator_hub/widgets/custom_drop_down.dart';
import 'package:online_calculator_hub/widgets/custom_button.dart';
import 'package:online_calculator_hub/widgets/custom_result_container.dart';

import '../../widgets/custom_text.dart';

class WaterIntakeView extends StatelessWidget {
  final String title;
  final _formKey = GlobalKey<FormState>();

  WaterIntakeView({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    final WaterIntakeController wController = Get.put(WaterIntakeController());
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
              crossAxisAlignment: CrossAxisAlignment.start,
              spacing: 10,
              children: [
                TextWidget(
                  text:
                      "Calculate your daily water intake requirements based on your weight, activity level, and climate.",
                  fontSize: 16,
                  weight: FontWeight.normal,
                  textcolor: Colors.black,
                  align: TextAlign.start,
                ),

                CustomInputField(
                  label: 'Weight',
                  hintText: '70',
                  isNumeric: true,
                  keyboardType: TextInputType.numberWithOptions(decimal: true),
                  controller: wController.weightController,
                ),
                CustomInputField(
                  label: "Exercise Duration (minutes/day)",
                  hintText: "30",
                  isNumeric: true,
                  keyboardType: TextInputType.numberWithOptions(decimal: true),
                  controller: wController.exerciseMinutesController,
                ),
                CustomDropdown(
                    label: "Climate",
                    value: "Normal/Moderate",
                    items: ["Normal/Moderate", "Hot/Humid", "Cold/Dry"],
                    onChanged: (value) => () {
                      wController.setSelectedClimate(value);
                      wController.clicked.value=false;
                      wController.showResult.value=false;
                    },
                  ),

                SizedBox(height: 5),
                Obx(
                  ()=> CustomTextButton(
                      text: wController.clicked.value ? "Calculated":"Calculate Water Intake",
                      onPressed: () {
                        if (_formKey.currentState!.validate()) {
                          wController.calculateWaterIntake();
                          FocusScope.of(context).unfocus();
                          wController.showResult.value = true;
                          wController.clicked.value=true;
                        }
                      },
                      buttonColor:wController.clicked.value ? Colors.green: AppColors.PrimaryColor,
                      textColor: Colors.white,
                    ),
                ),


                Obx(() {
                  if (wController.showResult.value) {
                    return CustomResultContainer(
                      title: "Your Water Intake",
                      text1: "${wController.result.value} Liters/day",
                      text2:
                          "Approximately:${(wController.total / 0.25).round()} glasses (250ml each)",
                      text3: "Base intake: ${wController.baseIntake} L",
                      text4: "Exercise bonus: ${wController.exerciseIntake} L",
                      resetText: "Reset",
                      clipboardText: "Copy to Clipboard",
                      clipBoardFunction: (){
                        wController.copyResult();

                      },
                      reset: () {
                        wController.reset();
                        wController.showResult.value = false;
                      },
                    );
                  }
                  return SizedBox.shrink();
                }),
                TextWidget(
                  text: "Staying Hydrated",
                  fontSize: 18,
                  weight: FontWeight.w600,
                  textcolor: AppColors.PrimaryColor,
                ),
                TextWidget(
                  text:
                      "Proper hydration is essential for maintaining body temperature, removing waste, and lubricating joints. Your water needs depend on many factors including activity level, climate, and overall health.",
                  fontSize: 16,
                  weight: FontWeight.normal,
                  textcolor: Colors.grey,
                  align: TextAlign.start,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
