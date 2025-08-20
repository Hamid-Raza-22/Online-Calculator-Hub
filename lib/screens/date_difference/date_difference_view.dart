import 'package:flutter/material.dart';
import 'package:online_calculator_hub/utils/Constants/colors.dart';
import 'package:online_calculator_hub/widgets/custom_date_time_field.dart';
import 'package:online_calculator_hub/widgets/custom_text.dart';
import 'package:online_calculator_hub/widgets/custom_check_box.dart';
import 'package:online_calculator_hub/widgets/custom_app_bar.dart';
import 'package:online_calculator_hub/widgets/custom_button.dart';

class DateDifferenceView extends StatelessWidget {
  final String title;

  const DateDifferenceView({super.key, required this.title});

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
                "Calculate the number of days between two dates for planning events, tracking deadlines, or measuring time periods.",
                fontSize: 16,
                weight: FontWeight.normal,
                textcolor: Colors.grey,
              ),
              CustomDateField(label: "Start Date"),
              CustomDateField(label: "End Date"),
              CheckBoxWidget(title: "Include end date in calculation",),
              CustomTextButton(text: "Calculate Difference", onPressed: (){}, buttonColor:AppColors.PrimaryColor,textColor: Colors.white,),

            ],
          ),
        ),
      ),
    );
  }
}
