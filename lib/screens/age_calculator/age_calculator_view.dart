import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:online_calculator_hub/screens/age_calculator/age_calculator_controller.dart';
import 'package:online_calculator_hub/utils/Constants/colors.dart';
import 'package:online_calculator_hub/widgets/custom_date_time_field.dart';
import 'package:online_calculator_hub/widgets/custom_text.dart';
import 'package:online_calculator_hub/widgets/custom_app_bar.dart';
import 'package:online_calculator_hub/widgets/custom_button.dart';

class AgeCalculatorView extends StatelessWidget {
  final String title;
  final AgeController ageController=Get.put(AgeController());

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
              CustomDateField(label: "Date of Birth",onChanged: (date){
                ageController.setDob(date!);
              },),
              CustomDateField(label: "Calculate Age On",onChanged: (date){
                ageController.setCalculateOn(date!);
              },),
              CustomTextButton(text: "Calculate Age", onPressed: (){
                ageController.calculateAge();
                Get.defaultDialog(
                  title: "Your BMI",
                  titleStyle: TextStyle(fontWeight: FontWeight.bold,color: AppColors.PrimaryColor),

                  middleText:
                  "Years:  ${ageController.years}\n"
                      "Months: ${ageController.months}\n"
                      "Days: ${ageController.days}",
                  confirm: SizedBox(
                    width: 70,
                    child: CustomTextButton(
                      text: "Ok",
                      onPressed: () => { ageController.reset(),Get.back()},
                      buttonColor: AppColors.PrimaryColor,
                      size: 80,
                      textColor: Colors.white,
                    ),
                  ),
                );
              }, buttonColor:AppColors.PrimaryColor,textColor: Colors.white,),
              CustomTextButton(text: "Reset", onPressed: (){}, buttonColor: Colors.grey,textColor: Colors.white,)

            ],
          ),
        ),
      ),
    );
  }
}
