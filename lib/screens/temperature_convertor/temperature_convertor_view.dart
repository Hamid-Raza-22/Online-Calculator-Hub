import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:online_calculator_hub/screens/temperature_convertor/temperature_convertor_controller.dart';
import 'package:online_calculator_hub/utils/Constants/colors.dart';
import 'package:online_calculator_hub/widgets/custom_input_field.dart';
import 'package:online_calculator_hub/widgets/custom_app_bar.dart';
import 'package:online_calculator_hub/widgets/custom_drop_down.dart';
import 'package:online_calculator_hub/widgets/custom_button.dart';

class TemperatureConvertorView extends StatelessWidget {
  final TemperatureController temperatureController = Get.put(
    TemperatureController(),
  );
  final String title;
  final _formKey = GlobalKey<FormState>();

  TemperatureConvertorView({super.key, required this.title});

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
                label: "Temperature",
                hintText: '0',
                controller: temperatureController.inputController,
              ),
              CustomDropdown(
                label: "From",
                value: 'Celcius(C)',
                items: ['Celcius(C)', 'Fahrenheit(F)', 'Kelvin(k)'],
                onChanged: (value) {
                  temperatureController.setFromUnit(value!);
                },
              ),
              CustomDropdown(
                label: "To",
                value: 'Fahrenheit(F)',
                items: ['Celcius(C)', 'Fahrenheit(F)', 'Kelvin(k)'],
                onChanged: (value) {
                  temperatureController.setToUnit(value!);
                },
              ),
              CustomTextButton(
                text: "Convert",
                onPressed: () {
                  if (_formKey.currentState!.validate()) {
                    temperatureController.convert();
                    temperatureController.showResult.value = true;
                  }
                },
                buttonColor: AppColors.PrimaryColor,
                textColor: Colors.white,
              ),
              Obx(() {
                if (temperatureController.showResult.value) {
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
                          "From: ${temperatureController.inputController.text.toString()} ${temperatureController.fromUnit} ",
                        ),
                        Text("To: ${temperatureController.toUnit}"),
                        Text(
                          "converted value: ${temperatureController.result} ",
                        ),
                        SizedBox(
                          width: 70,
                          child: CustomTextButton(
                            text: "Ok",
                            onPressed: () => {
                              temperatureController.reset(),
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
