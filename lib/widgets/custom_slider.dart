import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:online_calculator_hub/utils/Constants/colors.dart';import '../screens/password_generator/password_generate_controller.dart';



class Customslider extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final controller = Get.find<PasswordController>();

    return Obx(() => Column(
      children: [
        SliderTheme(
          data: SliderThemeData(

            activeTrackColor: AppColors.PrimaryColor,
            inactiveTrackColor: AppColors.PrimaryColor.withValues(alpha: 0.1),
            thumbColor: AppColors.PrimaryColor.withValues(alpha: 0.7),

          ),
          child: Slider(
            value: controller.passwordLength.value.toDouble(),
            min: 4.0,
            max: 50.0,

            label: controller.passwordLength.value.toString(),
            onChanged: (val) =>
                controller.setLength(val.round()),
          ),
        ),
        Text(
          "${controller.passwordLength.value}",
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
      ],
    ));
  }
}
