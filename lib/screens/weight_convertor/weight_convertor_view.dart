import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:online_calculator_hub/screens/weight_convertor/weight_convertor_controller.dart';
import 'package:online_calculator_hub/utils/Constants/colors.dart';
import 'package:online_calculator_hub/widgets/custom_input_field.dart';
import 'package:online_calculator_hub/widgets/custom_app_bar.dart';
import 'package:online_calculator_hub/widgets/custom_drop_down.dart';
import 'package:online_calculator_hub/widgets/custom_button.dart';

class WeightConvertorView extends StatelessWidget {
  final WeightController weightController = Get.put(WeightController());
  final String title;
  final _formKey = GlobalKey<FormState>();

  WeightConvertorView({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        bgColor: AppColors.PrimaryColor,
        iconColor: Colors.white,
        title: title,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: Column(
            spacing: 10,
            children: [
              CustomInputField(
                label: "Value",
                hintText: '1',
                controller: weightController.inputValue,
              ),
              CustomDropdown(
                label: "From",
                value: 'Kilogram(kg)',
                items: [
                  'Kilogram(kg)',
                  'Gram(g)',
                  'Milligram(mg)',
                  'Pound(Ib)',
                  'Metric Ton',
                  'Stone',
                  'Ounce(oz)',
                ],
                onChanged: (value) {
                  weightController.setSelectedFrom(value);
                },
              ),
              CustomDropdown(
                label: "To",
                value: 'Pound(Ib)',
                items: [
                  'Kilogram(kg)',
                  'Gram(g)',
                  'Milligram(mg)',
                  'Pound(Ib)',
                  'Metric Ton',
                  'Stone',
                  'Ounce(oz)',
                ],
                onChanged: (value) {
                  if (_formKey.currentState!.validate()) {
                    weightController.setSelectedTo(value);
                    weightController.showResult.value = true;
                  }
                },
              ),
              CustomTextButton(
                text: "Convert",
                onPressed: () {
                  weightController.convert();
                },
                buttonColor: AppColors.PrimaryColor,
                textColor: Colors.white,
              ),
              Obx(() {
                if (weightController.showResult.value) {
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
                          "Your Converted Values",
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 18,
                            color: AppColors.PrimaryColor,
                          ),
                        ),
                        const SizedBox(height: 8),
                        Text(
                          "From: ${weightController.inputValue.text.toString()} ${weightController.fromUnit} ",
                        ),
                        Text("To: ${weightController.toUnit}"),
                        Text("converted value: ${weightController.result}"),
                        SizedBox(
                          width: 70,
                          child: CustomTextButton(
                            text: "Ok",
                            onPressed: () => {
                              weightController.reset(),
                              Get.back(),
                            },
                            buttonColor: AppColors.PrimaryColor,
                            textColor: Colors.white,
                          ),
                        ),
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
    );
  }
}
