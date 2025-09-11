import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:online_calculator_hub/screens/length_convertor/length_convertor_controller.dart';
import 'package:online_calculator_hub/utils/Constants/colors.dart';
import 'package:online_calculator_hub/widgets/custom_input_field.dart';
import 'package:online_calculator_hub/widgets/custom_app_bar.dart';
import 'package:online_calculator_hub/widgets/custom_drop_down.dart';
import 'package:online_calculator_hub/widgets/custom_button.dart';
import 'package:online_calculator_hub/widgets/custom_result_container.dart';

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
          child: SingleChildScrollView(
            child: Column(
              spacing: 10,
              children: [
                CustomInputField(
                  label: "Value",
                  hintText: '1',
                  isNumeric: true,
                  controller: lengthController.lengthValue,
                  keyboardType: TextInputType.numberWithOptions(decimal: true),
                ),
                Obx(
                  ()=> CustomDropdown(
                    label: "From",
                    value: lengthController.fromLengthUnit.value,
                    items: lengthController.fromLengthUnitList,
                    onChanged: (value) {
                      if (_formKey.currentState!.validate()) {
                        lengthController.setSelectedFrom(value!);
                        lengthController.showResult.value = false;
                        lengthController.clicked.value = false;
                      }
                    },
                  ),
                ),
                Obx(
                  ()=> CustomDropdown(
                    label: "To",
                    value: lengthController.toLengthUnit.value,
                    items:lengthController.toLengthUnitList,
                    onChanged: (value) {

                      if (_formKey.currentState!.validate()) {
                        lengthController.setSelectedTo(value!);
                        lengthController.showResult.value = false;
                        lengthController.clicked.value = false;
                      }
                    },
                  ),
                ),
                Obx(
                  ()=> CustomTextButton(
                    text: lengthController.clicked.value ? "Converted" : "Convert",
                    onPressed: () {
                      if (_formKey.currentState!.validate()) {
                        lengthController.convert();
                        FocusScope.of(context).unfocus();
                        lengthController.showResult.value = true;
                        lengthController.clicked.value=true;
                      }
                    },
                    buttonColor: lengthController.clicked.value
                        ? Colors.green
                        : AppColors.PrimaryColor,
                    textColor: Colors.white,
                  ),
                ),
                Obx(() {
                  if (lengthController.showResult.value) {
                    return CustomResultContainer(title: "Your Converted Values",
                        text1: "From: ${lengthController.lengthValue.text
                            .toString()} ${lengthController.fromLengthUnit}",
                        text2:"To: ${lengthController.toLengthUnit}",
                        text3: "converted value: ${lengthController.result} ${lengthController.toLengthUnit}",
                        clipboardText: "Copy to Clipboard",
                        clipBoardFunction: (){
                      lengthController.copyResult();
                        },
                        resetText: "reset",
                        reset: (){
                      lengthController.reset();
                      lengthController.showResult.value=false;
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
