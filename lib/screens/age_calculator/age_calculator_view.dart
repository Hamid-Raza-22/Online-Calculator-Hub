import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:online_calculator_hub/screens/age_calculator/age_calculator_controller.dart';
import 'package:online_calculator_hub/utils/Constants/colors.dart';
import 'package:online_calculator_hub/widgets/custom_date_time_field.dart';
import 'package:online_calculator_hub/widgets/custom_text.dart';
import 'package:online_calculator_hub/widgets/custom_app_bar.dart';
import 'package:online_calculator_hub/widgets/custom_button.dart';

import '../../widgets/custom_result_container.dart';

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
                    controller: ageController.dobController,
                    onChanged: (date) {
                      ageController.setDob(date!);
                      ageController.clicked.value=false;
                      ageController.showResult.value=false;
                    },
                  ),
                CustomDateField(
                  label: "Calculate Age On",
                  controller: ageController.calculateOnController,
                  onChanged: (date) {
                    ageController.setCalculateOn(date!);
                    ageController.clicked.value=false;
                    ageController.showResult.value=false;
                  },
                ),
                Obx(
                  ()=>CustomTextButton(
                    text: ageController.clicked.value ? "Calculated":"Calculate Age",
                    onPressed: () {
                      if (_formKey.currentState!.validate()) {
                        ageController.calculateAge();
                        FocusScope.of(context).unfocus();
                        ageController.showResult.value = true;
                        ageController.clicked.value=true;
                      }
                    },
                    buttonColor: ageController.clicked.value ? Colors.green:AppColors.PrimaryColor,
                    textColor: Colors.white,
                  ),
                ),

                Obx(() {
                  if (ageController.showResult.value) {
                    return CustomResultContainer(title:"Your Age:" , text1:"Years: ${ageController.years}", text2: "Months: ${ageController.months}",text3: "Days: ${ageController.days}", clipboardText:"Copy to clipboard" , resetText:"Reset", clipBoardFunction: (){
                      ageController.copyResult();
                    }, reset:(){
                      ageController.reset();
                      ageController.showResult.value=false;
                    });
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
