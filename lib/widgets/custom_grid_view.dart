import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:online_calculator_hub/screens/Age%20Calculator/age_calculator_view.dart';
import 'package:online_calculator_hub/screens/BMI%20Calculator/BMI_calculator_view.dart';
import 'package:online_calculator_hub/screens/Calories%20Calculator/Calories_calculator_view.dart';
import 'package:online_calculator_hub/screens/Countdown%20Timer/countdown_timer_view.dart';
import 'package:online_calculator_hub/screens/Date%20Difference/date_difference_view.dart';
import 'package:online_calculator_hub/screens/Length%20Convertor/length_convertor_view.dart';
import 'package:online_calculator_hub/screens/Temperature%20Convertor/temperature_convertor_view.dart';
import 'package:online_calculator_hub/screens/Water%20Intake/water_intake_view.dart';
import 'package:online_calculator_hub/screens/Weight%20Convertor/weight_convertor_view.dart';
import 'package:online_calculator_hub/utils/Constants/toolsTexts.dart';
import 'package:online_calculator_hub/widgets/custom_card_widget.dart';

class CustomGridView extends StatelessWidget {
  const CustomGridView({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        spacing: 10,
        children: [
          Row(
            spacing: 8,
            children: [
              BottomElevatedCard(
                text: Toolstexts.BMI,
                onTap: () {
                  Get.to(BmiCalculatorView(title:Toolstexts.BMI ,));
                  
                },
                C_icon: Icons.health_and_safety,
              ),
              BottomElevatedCard(
                text: Toolstexts.Calorie_Calculator,
                onTap: () {
                  Get.to(CaloriesCalculatorView(title:  Toolstexts.Calorie_Calculator));
                },
                C_icon: Icons.health_and_safety,
              ),
              BottomElevatedCard(
                text: Toolstexts.water_intake,
                onTap: () {
                  Get.to(WaterIntakeView(title: 'Water Intake Calculator'));
                },
                C_icon: Icons.health_and_safety,
              ),
            ],
          ),
          Row(
            spacing: 8,
            children: [
              BottomElevatedCard(
                text: Toolstexts.age_Calculator,
                onTap: () {
                  Get.to(AgeCalculatorView(title: Toolstexts.age_Calculator));
                },
                C_icon: Icons.health_and_safety,
              ),
              BottomElevatedCard(
                text:Toolstexts.date_difference,
                onTap: () {
                  Get.to(DateDifferenceView(title: Toolstexts.date_difference));
                },
                C_icon: Icons.health_and_safety,
              ),
              BottomElevatedCard(
                text: Toolstexts.countdown_calculator,
                onTap: () {
                 Get.to(CountdownTimerView(title: Toolstexts.countdown_calculator));
                },
                C_icon: Icons.health_and_safety,
              ),
            ],
          ),
          Row(
            spacing: 8,
            children: [
              BottomElevatedCard(
                text: Toolstexts.Lenght_converter,
                onTap: () {
                  Get.to(LengthConvertorView(title: Toolstexts.Lenght_converter));
                },
                C_icon: Icons.health_and_safety,
              ),
              BottomElevatedCard(
                text:Toolstexts.Weight_converter,
                onTap: () {
                 Get.to(WeightConvertorView(title: Toolstexts.Weight_converter));
                },
                C_icon: Icons.health_and_safety,
              ),
              BottomElevatedCard(

                text: Toolstexts.Temperature_Converter,
                onTap: () {
                  Get.to(TemperatureConvertorView(title: Toolstexts.Temperature_Converter,));
                },
                C_icon: Icons.health_and_safety,
              ),
            ],
          ),
          Row(
            spacing: 8,
            children: [
              BottomElevatedCard(
                text: "Word Counter",
                onTap: () {
                  Get.snackbar(
                    'Title',
                    'This is a simple GetX snackbar!',
                  );
                },
                C_icon: Icons.health_and_safety,
              ),
              BottomElevatedCard(
                text: "Case Converter",
                onTap: () {
                  Get.snackbar(
                    'Title',
                    'This is a simple GetX snackbar!',
                  );
                },
                C_icon: Icons.health_and_safety,
              ),
              BottomElevatedCard(
                text: "Password Generator",
                onTap: () {
                  Get.snackbar(
                    'Title',
                    'This is a simple GetX snackbar!',
                  );
                },
                C_icon: Icons.health_and_safety,
              ),
            ],
          ),
        ],
      ),
    );
  }
}
