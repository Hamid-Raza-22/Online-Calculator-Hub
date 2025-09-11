import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:online_calculator_hub/screens/password_generator/password_generate_controller.dart';
import 'package:online_calculator_hub/utils/Constants/colors.dart';
import 'package:online_calculator_hub/widgets/custom_result_container.dart';
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
                        onChanged: (val) {
                          controller.setIncludeUperCase(val!);
                          controller.showResult.value=false;
                          controller.clicked.value=false;
                        },
                      ),
                    ),
                    Obx(
                      () => CheckBoxWidget(
                        title: 'Include Lowercase Letters (a-z)',
                        value: controller.includeLowercase.value,
                        onChanged: (val) {
                          controller.setLowerCase(val!);
                          controller.showResult.value = false;
                          controller.clicked.value = false;
                        },
                      ),
                    ),
                    Obx(
                      () => CheckBoxWidget(
                        title: 'Include Numbers (0-9)',
                        value: controller.includeNumbers.value,
                        onChanged: (val) {
                          controller.setIncludeNumbers(val!);
                          controller.showResult.value = false;
                          controller.clicked.value = false;
                        },
                      ),
                    ),

                    Obx(
                      () => CheckBoxWidget(
                        title: 'Include Symbols (!@#\$%^&*)',
                        value: controller.includeSymbols.value,
                        onChanged: (val) {
                          controller.setIncludeSymbols(val!);
                          controller.showResult.value = false;
                          controller.clicked.value = false;
                        },
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 10),
                Obx(
                  () => CustomTextButton(
                    text: controller.clicked.value
                        ? "Generated"
                        : "Generate Password",
                    onPressed: () {
                      if (_formKey.currentState!.validate()) {
                        controller.generatePassword();
                        FocusScope.of(context).unfocus();
                        controller.showResult.value = true;
                        controller.clicked.value = true;
                      }
                    },

                    buttonColor: controller.clicked.value
                        ? Colors.green
                        : AppColors.PrimaryColor,
                    textColor: Colors.white,
                  ),
                ),
                Obx(() {
                  if (controller.showResult.value) {
                    return CustomResultContainer(
                      title: "Password:  ${controller.generatedPassword}",
                      clipboardText: "Copy to Clipboard",
                      clipBoardFunction: () {
                        controller.copyToClipboard();
                      },
                      resetText: "Reset",
                      reset: () {
                        controller.clearPassword();
                      },
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
