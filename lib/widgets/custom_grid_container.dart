import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:online_calculator_hub/utils/Constants/colors.dart';
import 'package:online_calculator_hub/utils/Constants/toolsTexts.dart';
import 'package:online_calculator_hub/widgets/custom_text.dart';
import 'package:online_calculator_hub/widgets/custom_card_widget.dart';
import '../screens/age_calculator/age_calculator_view.dart';
import '../screens/bmi_calculator/bmi_calculator_view.dart';
import '../screens/calories_calculator/calories_calculator_view.dart';
import '../screens/case_convertor/case_convertor_view.dart';
import '../screens/countdown_timer/countdown_timer_view.dart';
import '../screens/date_difference/date_difference_view.dart';
import '../screens/length_convertor/length_convertor_view.dart';
import '../screens/password_generator/password_generator_view.dart';
import '../screens/temperature_convertor/temperature_convertor_view.dart';
import '../screens/water_intake/water_intake_view.dart';
import '../screens/weight_convertor/weight_convertor_view.dart';
import '../screens/word_counter/word_counter_view.dart';

class CustomGridView extends StatelessWidget {
  const CustomGridView({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,

        children: [
          TextWidget(text: "Health & Fitness Calculators", fontSize: 22, weight: FontWeight.bold,textcolor: AppColors.PrimaryColor,),
          Padding(
            padding: const EdgeInsets.only(bottom: 16.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,

              children: [
                BottomElevatedCard(
                  text: Toolstexts.BMI,
                  onTap: () {
                    Get.to(BmiCalculatorView(title:Toolstexts.BMI ,));

                  },
                  cIcon: Icons.health_and_safety,
                ),
                BottomElevatedCard(
                  text: Toolstexts.Calorie_Calculator,
                  onTap: () {
                    Get.to(CaloriesCalculatorView(title:  Toolstexts.Calorie_Calculator));
                  },
                  cIcon: Icons.health_and_safety,
                ),
                BottomElevatedCard(
                  text: Toolstexts.water_intake,
                  onTap: () {
                    Get.to(WaterIntakeView(title: 'Water Intake Calculator'));
                  },
                  cIcon:Icons.local_drink,
                ),
              ],
            ),
          ),
          TextWidget(text: "Date & Time Calculators", fontSize: 22, weight: FontWeight.bold,textcolor: AppColors.PrimaryColor,),
          Padding(
            padding: const EdgeInsets.only(bottom: 16.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                BottomElevatedCard(
                  text: Toolstexts.age_Calculator,
                  onTap: () {
                    Get.to(AgeCalculatorView(title: Toolstexts.age_Calculator));
                  },
                  cIcon: Icons.calendar_month,
                ),
                BottomElevatedCard(
                  text:Toolstexts.date_difference,
                  onTap: () {
                    Get.to(DateDifferenceView(title: Toolstexts.date_difference));
                  },
                  cIcon: Icons.date_range,
                ),
                BottomElevatedCard(
                  text: Toolstexts.countdown_calculator,
                  onTap: () {
                   Get.to(CountdownTimerView(title: Toolstexts.countdown_calculator));
                  },
                  cIcon:Icons.timer,
                ),
              ],
            ),
          ),
          TextWidget(text: "Unit Converters", fontSize: 22, weight: FontWeight.bold,textcolor: AppColors.PrimaryColor,),
          Padding(
            padding: const EdgeInsets.only(bottom: 16.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                BottomElevatedCard(
                  text: Toolstexts.Lenght_converter,
                  onTap: () {
                    Get.to(LengthConvertorView(title: Toolstexts.Lenght_converter));
                  },
                  cIcon: Icons.straighten,
                ),
                BottomElevatedCard(
                  text:Toolstexts.Weight_converter,
                  onTap: () {
                   Get.to(WeightConvertorView(title: Toolstexts.Weight_converter));
                  },
                  cIcon:Icons.monitor_weight,
                ),
                BottomElevatedCard(

                  text: Toolstexts.Temperature_Converter,
                  onTap: () {
                    Get.to(TemperatureConvertorView(title: Toolstexts.Temperature_Converter,));
                  },
                  cIcon: Icons.thermostat,
                ),
              ],
            ),
          ),
          TextWidget(text: "Text & Web Tools", fontSize: 22, weight: FontWeight.bold,textcolor: AppColors.PrimaryColor,),
          Padding(
            padding: const EdgeInsets.only(bottom: 16.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                BottomElevatedCard(
                  text: Toolstexts.word_counter,
                  onTap: () {
                   Get.to(WordCounterView(title: 'Word & Character Counter'));
                  },
                  cIcon:  Icons.text_fields,
                ),
                BottomElevatedCard(
                  text: Toolstexts.Case_Converter,
                  onTap: () {
                   Get.to(CaseConvertorView(title:  Toolstexts.Case_Converter,));
                  },
                  cIcon: Icons.swap_horiz,
                ),
                BottomElevatedCard(
                  text: Toolstexts.Password_Generator,
                  onTap: () {
                   Get.to(PasswordGeneratorView(title: Toolstexts.Password_Generator));
                  },
                  cIcon: Icons.password,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
