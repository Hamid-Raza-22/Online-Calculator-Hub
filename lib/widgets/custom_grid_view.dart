import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:online_calculator_hub/screens/BMI%20Calculator/BMI_calculator_view.dart';
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
                text: "BMI Calculator",
                onTap: () {
                  Get.to(BmiCalculatorView(title:"BMI Calculator" ,));
                  Get.snackbar(
                    'BMI Calculator',
                    'This is a simple GetX snackbar!',
                    backgroundColor: Colors.blue
                  );
                },
                C_icon: Icons.health_and_safety,
              ),
              BottomElevatedCard(
                text: "Calorie Calculator",
                onTap: () {
                  Get.snackbar(
                    'Title',
                    'This is a simple GetX snackbar!',
                  );
                },
                C_icon: Icons.health_and_safety,
              ),
              BottomElevatedCard(
                text: "Water Intake",
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
          Row(
            spacing: 8,
            children: [
              BottomElevatedCard(
                text: "Age Calculator",
                onTap: () {
                  Get.snackbar(
                    'Title',
                    'This is a simple GetX snackbar!',
                  );
                },
                C_icon: Icons.health_and_safety,
              ),
              BottomElevatedCard(
                text: "Date Difference",
                onTap: () {
                  Get.snackbar(
                    'Title',
                    'This is a simple GetX snackbar!',
                  );
                },
                C_icon: Icons.health_and_safety,
              ),
              BottomElevatedCard(
                text: "Countdown Timer",
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
          Row(
            spacing: 8,
            children: [
              BottomElevatedCard(
                text: "Length Converter",
                onTap: () {
                  Get.snackbar(
                    'Title',
                    'This is a simple GetX snackbar!',
                  );
                },
                C_icon: Icons.health_and_safety,
              ),
              BottomElevatedCard(
                text: "Weight Converter",
                onTap: () {
                  Get.snackbar(
                    'Title',
                    'This is a simple GetX snackbar!',
                  );
                },
                C_icon: Icons.health_and_safety,
              ),
              BottomElevatedCard(

                text: "Temperature Converter",
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
