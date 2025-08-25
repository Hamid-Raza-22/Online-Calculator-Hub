import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:online_calculator_hub/screens/password_generator/password_generate_controller.dart';
import 'package:online_calculator_hub/utils/Constants/colors.dart';
import 'package:online_calculator_hub/widgets/custom_text.dart';
import 'package:online_calculator_hub/widgets/custom_app_bar.dart';
import 'package:online_calculator_hub/widgets/custom_check_box.dart';
import 'package:online_calculator_hub/widgets/custom_slider.dart';
import 'package:online_calculator_hub/widgets/custom_button.dart';

class PasswordGeneratorView extends StatelessWidget {
  final _formKey = GlobalKey<FormState>();
  final controller = Get.put(PasswordController());
  final String title;

  PasswordGeneratorView({super.key, required this.title});

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
              crossAxisAlignment: CrossAxisAlignment.start,
              spacing: 10,
              children: [
                Column(

                  children: [
                    Customslider(),
                    Obx(
                      () => CheckBoxWidget(
                        title: 'Include Uppercase Letters (A-Z)',
                        value: controller.includeUppercase.value,
                        onChanged: (val) => controller.setIncludeUperCase(val!),
                      ),
                    ),
                    Obx(
                      () => CheckBoxWidget(
                        title: 'Include Lowercase Letters (a-z)',
                        value: controller.includeLowercase.value,
                        onChanged: (val) => controller.setLowerCase(val!),
                      ),
                    ),
                    Obx(
                      () => CheckBoxWidget(
                        title: 'Include Numbers (0-9)',
                        value: controller.includeNumbers.value,
                        onChanged: (val) => controller.setIncludeNumbers(val!),
                      ),
                    ),

                    Obx(
                      () => CheckBoxWidget(
                        title: 'Include Symbols (!@#\$%^&*)',
                        value: controller.includeSymbols.value,
                        onChanged: (val) => controller.setIncludeSymbols(val!),
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 10),
                CustomTextButton(
                  text: "Generate Password",
                  onPressed: () {
                    if (_formKey.currentState!.validate()) {
                      controller.generatePassword();
                      controller.showResult.value = true;
                    }
                  },

                  buttonColor: AppColors.PrimaryColor,
                  textColor: Colors.white,
                ),
                Obx(() {
                  if (controller.showResult.value) {
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
                            "Password:  ${controller.generatedPassword}",
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 18,
                              color: AppColors.PrimaryColor,
                            ),
                          ),
                          SizedBox(height: 10),
                          Row(
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
                                width: 120,
                                child: CustomTextButton(
                                  text: "Reset",
                                  onPressed: () {
                                    controller.clearPassword();
                                  },
                                  buttonColor: Colors.grey,
                                  size: 80,
                                  textColor: Colors.white,
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    );
                  }
                  return SizedBox.shrink();
                }),
                TextWidget(
                  text: "Password Strength Tips:",
                  fontSize: 18,
                  weight: FontWeight.w600,
                ),
                TextWidget(
                  text:
                      "Use at least 12 characters for better security\nInclude a mix of uppercase, lowercase, numbers, and symbol\nAvoid common words or personal information\nUse unique passwords for each account\nConsider using a password manager",
                  fontSize: 16,
                  weight: FontWeight.normal,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
