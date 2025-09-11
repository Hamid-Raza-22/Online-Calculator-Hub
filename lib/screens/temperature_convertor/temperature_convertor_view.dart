import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:online_calculator_hub/screens/temperature_convertor/temperature_convertor_controller.dart';
import 'package:online_calculator_hub/utils/Constants/colors.dart';
import 'package:online_calculator_hub/widgets/custom_input_field.dart';
import 'package:online_calculator_hub/widgets/custom_app_bar.dart';
import 'package:online_calculator_hub/widgets/custom_drop_down.dart';
import 'package:online_calculator_hub/widgets/custom_button.dart';

import '../../widgets/custom_result_container.dart';

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
          child: SingleChildScrollView(
            child: Column(
              spacing: 10,
              children: [
                CustomInputField(
                  label: "Temperature",
                  keyboardType: TextInputType.numberWithOptions(decimal: true),
                  hintText: '0',
                  controller: temperatureController.inputController,
                ),
                Obx(
                  ()=> CustomDropdown(
                    label: "From",
                    value: temperatureController.fromUnit.value,
                    items: temperatureController.fromUnitList,
                    onChanged: (value) {
                      temperatureController.setFromUnit(value!);
                      temperatureController.showResult.value=false;
                      temperatureController.clicked.value=false;
                    },
                  ),
                ),
                Obx(
                  ()=> CustomDropdown(
                    label: "To",
                    value: temperatureController.toUnit.value,
                    items:temperatureController.toUnitList,
                    onChanged: (value) {
                      temperatureController.setToUnit(value!);
                      temperatureController.showResult.value=false;
                      temperatureController.clicked.value=false;
                    },
                  ),
                ),
                Obx(
                  ()=> CustomTextButton(
                    text: temperatureController.clicked.value ?"Converted":"Convert",
                    onPressed: () {
                      if (_formKey.currentState!.validate()) {
                        temperatureController.convert();
                        FocusScope.of(context).unfocus();
                        temperatureController.showResult.value = true;
                        temperatureController.clicked.value=true;
                      }
                    },
                    buttonColor: temperatureController.clicked.value ? Colors.green:AppColors.PrimaryColor,
                    textColor: Colors.white,
                  ),
                ),
                Obx(() {
                  if (temperatureController.showResult.value) {
                    return CustomResultContainer(title: "Your Converted Values",
                        text1: "From: ${temperatureController.inputController.text} ${temperatureController.fromUnit}",
                        text2:"To: ${temperatureController.toUnit}",
                        text3: "converted value: ${temperatureController.result} ${temperatureController.toUnit} ",
                        clipboardText: "Copy to Clipboard",
                        clipBoardFunction: (){
                          temperatureController.copyResult();
                        },
                        resetText: "reset",
                        reset: (){
                          temperatureController.reset();
                          temperatureController.showResult.value=false;
                        });
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
