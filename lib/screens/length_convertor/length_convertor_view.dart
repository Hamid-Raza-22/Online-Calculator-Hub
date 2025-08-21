import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:online_calculator_hub/screens/length_convertor/length_convertor_controller.dart';
import 'package:online_calculator_hub/utils/Constants/colors.dart';
import 'package:online_calculator_hub/widgets/custom_input_field.dart';
import 'package:online_calculator_hub/widgets/custom_app_bar.dart';
import 'package:online_calculator_hub/widgets/custom_drop_down.dart';
import 'package:online_calculator_hub/widgets/custom_button.dart';

class LengthConvertorView extends StatelessWidget {
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
                if(value != null){
                  lengthController.setSelectedTo(value);
                }

              },
            ),
            CustomTextButton(
              text: "Convert",
              onPressed: () {
                lengthController.convert();
                Get.defaultDialog(
                  title: "Your Converted Values",
                  titleStyle: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: AppColors.PrimaryColor,
                  ),

                  middleText:
                      "From: ${lengthController.lengthValue.text.toString()} ${lengthController.fromUnit} \n"
                      "To: ${lengthController.toUnit}\n"
                      "converted value: ${lengthController.result} \n",
                  confirm: SizedBox(
                    width: 70,
                    child: CustomTextButton(
                      text: "Ok",
                      onPressed: () => {lengthController.reset(), Get.back()},
                      buttonColor: AppColors.PrimaryColor,
                      size: 80,
                      textColor: Colors.white,
                    ),
                  ),
                );
              },
              buttonColor: AppColors.PrimaryColor,
              textColor: Colors.white,
            ),
          ],
        ),
      ),
    );
  }
}
