import 'package:flutter/material.dart';
import 'package:online_calculator_hub/utils/Constants/colors.dart';
import 'package:online_calculator_hub/widgets/CustomDateTimeFeild.dart';
import 'package:online_calculator_hub/widgets/Text_widget.dart';
import 'package:online_calculator_hub/widgets/customAppBar.dart';
import 'package:online_calculator_hub/widgets/custom_button.dart';

class AgeCalculatorView extends StatelessWidget {
  final String title;

  const AgeCalculatorView({super.key, required this.title});

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
            spacing: 10,
            children: [
              TextWidget(
                text:
                    "Calculate your exact age in years, months, days, hours, and minutes.",
                fontSize: 16,
                weight: FontWeight.normal,
                textcolor: Colors.grey,
              ),
              CustomDateField(label: "Date of Birth"),
              CustomDateField(label: "Calculate Age On"),
              CustomTextButton(text: "Calculate Age", onPressed: (){}, buttonColor:AppColors.PrimaryColor,textColor: Colors.white,),
              CustomTextButton(text: "Reset", onPressed: (){}, buttonColor: Colors.grey,textColor: Colors.white,)

            ],
          ),
        ),
      ),
    );
  }
}
