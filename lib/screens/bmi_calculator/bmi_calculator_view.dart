import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:online_calculator_hub/utils/Constants/colors.dart';
import 'package:online_calculator_hub/widgets/custom_input_field.dart';
import 'package:online_calculator_hub/widgets/custom_text.dart';
import 'package:online_calculator_hub/widgets/custom_app_bar.dart';
import 'package:online_calculator_hub/widgets/custom_button.dart';
import 'bmi_controller.dart';

class BmiCalculatorView extends StatelessWidget {
  final _formKey = GlobalKey<FormState>();
  final BmiController controller = Get.put(BmiController());
  final String title;

  BmiCalculatorView({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
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
                        "Calculate your Body Mass Index (BMI) to determine if your weight is "
                        "in a healthy range for your height.",
                    fontSize: 16,
                    weight: FontWeight.normal,
                    align: TextAlign.start,

                  ),
                  CustomInputField(
                    label: "Height (cm)",
                    hintText: '170',
                    keyboardType: TextInputType.number,
                    controller: controller.heightController,
                  ),
                  CustomInputField(
                    label: "Weight (kg)",
                    hintText: '65',
                    keyboardType: TextInputType.number,
                    controller: controller.weightController,
                  ),
                  CustomTextButton(
                    text: "Calculate BMI",
                    textColor: Colors.white,
                    onPressed: () {
    if (_formKey.currentState!.validate()){
                      controller.calculateBmi();
                      Get.defaultDialog(
                        title: "Your BMI",
                        titleStyle: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: AppColors.PrimaryColor,
                        ),
                        content: SizedBox( 
                        width: Get.width * 0.9,
                        child: Center(
                          child: Text( "BMI:   ${controller.result.value.toStringAsFixed(2)}\n"
                              "Category:  ${controller.getBmiCategory()}\n",),
                        )
                      ),

                        
                           
                        confirm: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            SizedBox(
                              width: 150,
                              child: CustomTextButton(
                                text: "Copy to Clipboard",
                                onPressed: controller.copyToClipboard,
                                buttonColor: AppColors.PrimaryColor,
                                textColor: Colors.white,
                              ),
                            ),
                            SizedBox(
                              width: 100,
                              child: CustomTextButton(
                                text: "Reset",
                                onPressed: () {
                                  controller.reset();
                                  Get.back();
                                },
                                buttonColor: Colors.grey,
                                size: 80,
                                textColor: Colors.white,
                              ),
                            ),
                          ],
                        ),
                      );
    }
                    },
                    buttonColor: AppColors.PrimaryColor,

                  ),
                  CustomTextButton(
                    text: "Reset",
                    onPressed: () {
                      controller.reset();
                    },
                    buttonColor: Colors.grey,
                    textColor: Colors.black,
                  ),
                  SizedBox(height: 10),
                  TextWidget(
                    text: "Understanding BMI",
                    fontSize: 22,
                    weight: FontWeight.bold,
                    textcolor: AppColors.PrimaryColor,
                  ),
                  TextWidget(
                    text:
                        "Body Mass Index (BMI) is a simple calculation using height and weight to estimate body fat and assess health risks. While not perfect, it's a useful screening tool for weight categories.",
                    fontSize: 16,
                    weight: FontWeight.normal,
                    align: TextAlign.start,
                    textcolor: Colors.grey,
                  ),
                  SizedBox(height: 3),
                  TextWidget(
                    text: "BMI Categories:",
                    fontSize: 18,
                    weight: FontWeight.w600,
                    textcolor: AppColors.PrimaryColor,
                  ),
                  SizedBox(
                    width: 400,

                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        TextWidget(
                          text: "Underweight: BMI < 18.5",
                          fontSize: 16,
                          weight: FontWeight.normal,
                          textcolor: Colors.grey,
                        ),
                        TextWidget(
                          text: "Normal weight: BMI 18.5 - 24.9",
                          fontSize: 16,
                          weight: FontWeight.normal,
                          textcolor: Colors.grey,
                        ),
                        TextWidget(
                          text: "Overweight: BMI 25 - 29.9",
                          fontSize: 16,
                          weight: FontWeight.normal,
                          textcolor: Colors.grey,
                        ),
                        TextWidget(
                          text: "Obese: BMI ≥ 30",
                          fontSize: 16,
                          weight: FontWeight.normal,
                          textcolor: Colors.grey,
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
