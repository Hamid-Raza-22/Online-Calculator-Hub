import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:online_calculator_hub/screens/length_convertor/length_convertor_controller.dart';
import 'package:online_calculator_hub/utils/Constants/colors.dart';
import 'package:online_calculator_hub/widgets/custom_input_field.dart';
import 'package:online_calculator_hub/widgets/custom_app_bar.dart';
import 'package:online_calculator_hub/widgets/custom_drop_down.dart';
import 'package:online_calculator_hub/widgets/custom_button.dart';

class LengthConvertorView extends StatelessWidget {
  final _formKey = GlobalKey<FormState>();
  final LengthConverterController lengthController = Get.put(
    LengthConverterController(),
  );
  final String title;

  LengthConvertorView({super.key, required this.title});

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
                controller: lengthController.lengthValue,
                keyboardType: TextInputType.numberWithOptions(),
              ),
              CustomDropdown(
                label: "From",
                value: 'Meter(m)',
                items: [
                  'Meter(m)',
                  'Kilometer(km)',
                  'centimeter(cm)',
                  'Milieter(mm)',
                  'Mile',
                  'Yard',
                  'Foot',
                  'Inch',
                ],
                onChanged: (value) {
                  if (value != null) {
                    lengthController.setSelectedFrom(value);
                  }
                },
              ),
              CustomDropdown(
                label: "To",
                value: 'Foot',
                items: [
                  'Meter(m)',
                  'Kilometer(km)',
                  'centimeter(cm)',
                  'Milieter(mm)',
                  'Mile',
                  'Yard',
                  'Foot',
                  'Inch',
                ],
                onChanged: (value) {
                  if (value != null) {
                    lengthController.setSelectedTo(value);
                  }
                },
              ),
              CustomTextButton(
                text: "Convert",
                onPressed: () {
                  if (_formKey.currentState!.validate()) {
                    lengthController.convert();
                    lengthController.showResult.value = true;
                  }
                },
                buttonColor: AppColors.PrimaryColor,
                textColor: Colors.white,
              ),
              Obx(() {
                if (lengthController.showResult.value) {
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
                          "From: ${lengthController.lengthValue.text.toString()} ${lengthController.fromUnit}",
                        ),
                        Text("To: ${lengthController.toUnit}"),
                        Text("converted value: ${lengthController.result} "),
                        SizedBox(
                          width: 70,
                          child: CustomTextButton(
                            text: "Ok",
                            onPressed: () => {
                              lengthController.reset(),
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
