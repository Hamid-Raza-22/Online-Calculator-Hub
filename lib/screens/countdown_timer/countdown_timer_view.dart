import 'package:flutter/material.dart';
import 'package:online_calculator_hub/utils/Constants/colors.dart';
import 'package:online_calculator_hub/widgets/custom_date_time_field.dart';
import 'package:online_calculator_hub/widgets/custom_input_field.dart';
import 'package:online_calculator_hub/widgets/custom_app_bar.dart';
import 'package:online_calculator_hub/widgets/custom_time_selection_field.dart';
import 'package:online_calculator_hub/widgets/custom_button.dart';

class CountdownTimerView extends StatelessWidget {
  final String title;

  const CountdownTimerView({super.key, required this.title});

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
              CustomInputField(label: "Event Name", hintText: "New Year 2026"),
              CustomDateField(label: "Event Date"),
              Customtimeselectionfield( label: "Event Time"),
              CustomTextButton(text: "Start Countdown", onPressed: (){}, buttonColor:AppColors.PrimaryColor,textColor: Colors.white,)
            ],
          ),
        ),
      ),
    );
  }
}
