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
        child: Column(
          spacing: 10,
          children: [
            CustomInputField(label: "Value", hintText: '1',controller: weightController.inputValue,),
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
                'Ounce(oz)'
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
                'Ounce(oz)'
              ],
              onChanged: (value) {
                weightController.setSelectedTo(value);
                Get.defaultDialog(
                  title: "Your Converted Values",
                  titleStyle: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: AppColors.PrimaryColor,
                  ),

                  middleText:
                  "From: ${weightController.inputValue.text.toString()} ${weightController.fromUnit} \n"
                      "To: ${weightController.toUnit}\n"
                      "converted value: ${weightController.result} \n",
                  confirm: SizedBox(
                    width: 70,
                    child: CustomTextButton(
                      text: "Ok",
                      onPressed: () => {weightController.reset(), Get.back()},
                      buttonColor: AppColors.PrimaryColor,
                      size: 80,
                      textColor: Colors.white,
                    ),
                  ),
                );
              },
            ),
            CustomTextButton(text: "Convert", onPressed: (){
              weightController.convert();
            }, buttonColor: AppColors.PrimaryColor,textColor: Colors.white,)
          ],
        ),
      ),
    );
  }
}
