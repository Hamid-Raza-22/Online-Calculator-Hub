import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:online_calculator_hub/utils/Constants/colors.dart';
import 'package:online_calculator_hub/widgets/custom_multi_line_input.dart';
import 'package:online_calculator_hub/widgets/custom_app_bar.dart';
import 'package:online_calculator_hub/widgets/custom_button.dart';
import 'case_convertor_controller.dart';

class CaseConvertorView extends StatelessWidget {
  final _formKey = GlobalKey<FormState>();
  final controller = Get.put(TextConverterController());
  final String title;

  CaseConvertorView({super.key, required this.title});

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
                CustomMultiLineField(
                  label: "Input Text",
                  hint: 'Enter text to convert......',
                  controller: controller.inputController,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    CustomTextButton(
                      text: "UPPERCASE",
                      onPressed: () {
                        if (_formKey.currentState!.validate()) {
                          controller.toUppercase();
                        }
                      },
                      buttonColor: AppColors.PrimaryColor,
                      size: 110,
                      textColor: Colors.white,
                    ),
                    CustomTextButton(
                      text: "lowercase",
                      onPressed: () {
                        if (_formKey.currentState!.validate()) {
                          controller.toLowercase();
                        }
                      },
                      buttonColor: Colors.green,
                      size: 100,
                      textColor: Colors.white,
                    ),
                    CustomTextButton(
                      text: "Title Case",
                      onPressed: () {
                        if (_formKey.currentState!.validate()) {
                          controller.toTitleCase();
                        }
                      },
                      buttonColor: Colors.purpleAccent,
                      size: 100,
                      textColor: Colors.white,
                    ),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    CustomTextButton(
                      text: "Sentence case",
                      onPressed: () {
                        if (_formKey.currentState!.validate()) {
                          controller.toSentenceCase();
                        }
                      },
                      buttonColor: Colors.deepOrange,
                      size: 100,
                      textColor: Colors.white,
                    ),
                    CustomTextButton(
                      text: "aLtErNaTinG",
                      onPressed: () {
                        if (_formKey.currentState!.validate()) {
                          controller.toAlternatingCase();
                        }
                      },
                      buttonColor: Colors.pinkAccent,
                      size: 100,
                      textColor: Colors.white,
                    ),
                    CustomTextButton(
                      text: "iNVERSE",
                      onPressed: () {
                        if (_formKey.currentState!.validate()) {
                          controller.toInverseCase();
                        }
                      },
                      buttonColor: Colors.black26,
                      size: 100,
                      textColor: Colors.white,
                    ),
                  ],
                ),
                CustomMultiLineField(
                  label: "Converted Text",
                  hint: "Converted text show here.......",
                  controller: controller.outputController,
                  enabled: false,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,

                  children: [
                    CustomTextButton(
                      text: "Copy Result",
                      onPressed: controller.copyResult,
                      buttonColor: AppColors.PrimaryColor,
                      textColor: Colors.white,
                      size: 155,
                    ),
                    CustomTextButton(
                      text: "Reset",
                      onPressed: controller.clearAll,
                      buttonColor: Colors.grey,
                      textColor: Colors.white,
                      size: 155,
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}



