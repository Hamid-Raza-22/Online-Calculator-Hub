import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:online_calculator_hub/screens/weight_convertor/weight_convertor_controller.dart';
import 'package:online_calculator_hub/utils/Constants/colors.dart';
import 'package:online_calculator_hub/widgets/custom_input_field.dart';
import 'package:online_calculator_hub/widgets/custom_app_bar.dart';
import 'package:online_calculator_hub/widgets/custom_drop_down.dart';
import 'package:online_calculator_hub/widgets/custom_button.dart';

import '../../widgets/custom_result_container.dart';

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
          child: SingleChildScrollView(
            child: Column(
              spacing: 10,
              children: [
                CustomInputField(
                  label: "Value",
                  hintText: '1',
                  isNumeric: true,
                  keyboardType: TextInputType.numberWithOptions(decimal: true),
                  controller: weightController.inputValue,
                ),
                Obx(
                  () => CustomDropdown(
                    label: "From",
                    value: weightController.fromWeightUnit.value,
                    items: weightController.fromWeightUnitList,
                    onChanged: (value) {
                      if (_formKey.currentState!.validate()) {
                        weightController.setSelectedWeightFrom(value!);
                        weightController.showResult.value = false;
                        weightController.clicked.value = false;
                      }
                    },
                  ),
                ),
                Obx(
                  () => CustomDropdown(
                    label: "To",
                    value: weightController.toWeightUnit.value,
                    items: weightController.toWeightUnitList,
                    onChanged: (value) {
                      if (_formKey.currentState!.validate()) {
                        weightController.setSelectedWeightTo(value!);
                        weightController.showResult.value = false;
                        weightController.clicked.value = false;
                      }
                    },
                  ),
                ),
                Obx(
                  () => CustomTextButton(
                    text: weightController.clicked.value
                        ? "Converted"
                        : "Convert",
                    onPressed: () {
                      if (_formKey.currentState!.validate()) {
                        weightController.convert();
                        weightController.showResult.value = true;
                        weightController.clicked.value = true;
                        FocusScope.of(context).unfocus();
                      }
                    },
                    buttonColor: weightController.clicked.value
                        ? Colors.green
                        : AppColors.PrimaryColor,
                    textColor: Colors.white,
                  ),
                ),
                Obx(() {
                  if (weightController.showResult.value) {
                    return CustomResultContainer(
                      title: "Your Converted Values",
                      text1:
                          "From: ${weightController.inputValue.text} ${weightController.fromWeightUnit}",
                      text2: "To: ${weightController.toWeightUnit}",
                      text3: "converted value: ${weightController.result} ",
                      clipboardText: "Copy to Clipboard",
                      clipBoardFunction: () {
                        weightController.copyResult();
                      },
                      resetText: "reset",
                      reset: () {
                        weightController.reset();
                        weightController.showResult.value = false;
                      },
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
