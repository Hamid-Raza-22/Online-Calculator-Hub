import 'package:flutter/material.dart';
import 'package:online_calculator_hub/utils/Constants/colors.dart';
import 'package:online_calculator_hub/widgets/CustomInputFeild.dart';
import 'package:online_calculator_hub/widgets/customAppBar.dart';
import 'package:online_calculator_hub/widgets/customDropdown.dart';
import 'package:online_calculator_hub/widgets/custom_button.dart';

import '../../widgets/Text_widget.dart';

class WaterIntakeView extends StatelessWidget {
  final String title;

  const WaterIntakeView({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        bgColor: AppColors.PrimaryColor,
        iconColor: Colors.white,
        title: title,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            spacing: 10,
            children: [
              TextWidget(
                text:
                    "Calculate your daily water intake requirements based on your weight, activity level, and climate.",
                fontSize: 16,
                weight: FontWeight.normal,
                textcolor: Colors.grey,
              ),
        
              CustomInputField(
                label: 'Weight',
                hintText: '70',
                keyboardType: TextInputType.numberWithOptions(),
              ),
              CustomInputField(
                label: "Exercise Duration (minutes/day)",
                hintText: "30",
                keyboardType: TextInputType.numberWithOptions(),
              ),
              CustomDropdown(
                label: "Climate",
                value: "Normal/Moderate",
                items: ["Normal/Moderate", "Hot/Humid", "Cold/Dry"],
                onChanged: (value) => () {},
              ),
              SizedBox(height: 5,),
              CustomTextButton(text: "Calculate Water Intake", onPressed:(){}, buttonColor:AppColors.PrimaryColor,textColor: Colors.white,),
              TextWidget(text: "Staying Hydrated", fontSize: 18, weight: FontWeight.w600,textcolor: AppColors.PrimaryColor,),
              TextWidget(text: "Proper hydration is essential for maintaining body temperature, removing waste, and lubricating joints. Your water needs depend on many factors including activity level, climate, and overall health.", fontSize: 16, weight: FontWeight.normal,textcolor: Colors.grey,)
            ],
          ),
        ),
      ),
    );
  }
}
