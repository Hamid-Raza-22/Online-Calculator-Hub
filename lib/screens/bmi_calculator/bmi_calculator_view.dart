import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:online_calculator_hub/utils/Constants/colors.dart';
import 'package:online_calculator_hub/widgets/custom_input_field.dart';
import 'package:online_calculator_hub/widgets/custom_text.dart';
import 'package:online_calculator_hub/widgets/custom_app_bar.dart';
import 'package:online_calculator_hub/widgets/custom_button.dart';
import '../../widgets/custom_result_container.dart';
import 'bmi_controller.dart';
import 'package:url_launcher/url_launcher.dart';

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
                    isNumeric: true,
                    keyboardType: TextInputType.numberWithOptions(decimal: true),
                    controller: controller.heightController,
                  ),
                  CustomInputField(
                    label: "Weight (kg)",
                    hintText: '65',
                    isNumeric: true,
                    keyboardType: TextInputType.numberWithOptions(decimal: true),
                    controller: controller.weightController,
                  ),
                  Obx(
                    () => CustomTextButton(
                      text: controller.clicked.value
                          ? "Calculated"
                          : "Calculate BMI",
                      textColor: Colors.white,
                      onPressed: () {
                        if (_formKey.currentState!.validate()) {
                          controller.calculateBmi();
                          FocusScope.of(context).unfocus();
                          controller.showResult.value = true;
                          controller.clicked.value = true;
                        }
                      },
                      buttonColor: controller.clicked.value
                          ? Colors.green
                          : AppColors.PrimaryColor,
                    ),
                  ),

                  Obx(() {
                    if (controller.showResult.value && controller.clicked.value ) {
                      return CustomResultContainer(
                        title: "Your BMI:",
                        text1:
                            "BMI:   ${controller.result.value.toStringAsFixed(2)}",
                        text2: "Category:  ${controller.getBmiCategory()}",
                        clipboardText: "Copy to clipboard",
                        resetText: "Reset",
                        clipBoardFunction: () {
                          controller.copyToClipboard();
                        },
                        reset: () {
                          controller.reset();
                          controller.showResult.value = false;
                          controller.clicked.value=false;
                        },
                      );
                    }
                    return SizedBox.shrink();
                  }),
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
                          text: "The BMI calculations and categories are based on guidelines from:",
                          fontSize: 14,
                          weight: FontWeight.normal,
                          textcolor: Colors.grey.shade700,
                          align: TextAlign.start,
                        ),
                        SizedBox(height: 8),
                        _buildCitationLink(
                          "World Health Organization (WHO)",
                          "https://www.who.int/health-topics/obesity",
                        ),
                        _buildCitationLink(
                          "Centers for Disease Control and Prevention (CDC)",
                          "https://www.cdc.gov/healthyweight/assessing/bmi/index.html",
                        ),
                        _buildCitationLink(
                          "National Institutes of Health (NIH)",
                          "https://www.nhlbi.nih.gov/health/educational/lose_wt/BMI/bmicalc.htm",
                        ),
                        SizedBox(height: 8),
                        TextWidget(
                          text: "Note: BMI is a screening tool and should not be used as a diagnostic measure. Consult with a healthcare professional for personalized health advice.",
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
