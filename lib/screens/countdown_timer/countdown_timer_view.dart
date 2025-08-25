import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:online_calculator_hub/screens/countdown_timer/countdown_timer_controller.dart';
import 'package:online_calculator_hub/utils/Constants/colors.dart';
import 'package:online_calculator_hub/widgets/custom_date_time_field.dart';
import 'package:online_calculator_hub/widgets/custom_input_field.dart';
import 'package:online_calculator_hub/widgets/custom_app_bar.dart';
import 'package:online_calculator_hub/widgets/custom_time_selection_field.dart';
import 'package:online_calculator_hub/widgets/custom_button.dart';

class CountdownTimerView extends StatelessWidget {
  final _formKey = GlobalKey<FormState>();
  final controller = Get.put(CountdownController());
  final String title;

  CountdownTimerView({super.key, required this.title});

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
          child: Form(
            key: _formKey,
            child: Column(
              spacing: 10,
              children: [
                CustomInputField(
                  label: "Event Name",
                  hintText: "New Year 2026",
                  controller: controller.eventNameController,
                ),
                CustomDateField(
                  label: "Event Date",
                  onChanged: (date) => controller.setDate(date),
                ),
                Customtimeselectionfield(
                  label: "Event Time",
                  onChanged: (time) => controller.setTime(time),
                ),
                CustomTextButton(
                  text: "Start Countdown",
                  onPressed: () {
                    if (_formKey.currentState!.validate()) {
                      controller.startCountdown();
                      controller.showResult.value = true;
                    }
                  },
                  buttonColor: AppColors.PrimaryColor,
                  textColor: Colors.white,
                ),
                Obx(() {
                  if (controller.showResult.value) {
                    return Container(
                      width: 350,
                      margin: const EdgeInsets.only(top: 20),
                      padding: const EdgeInsets.all(16),
                      decoration: BoxDecoration(
                        color: Colors.grey.shade200,
                        borderRadius: BorderRadius.circular(12),
                        border: Border.all(color: AppColors.PrimaryColor),
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Countdown Started",
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 18,
                              color: AppColors.PrimaryColor,
                            ),
                          ),
                          const SizedBox(height: 8),
                          Text(
                            controller.formatDuration(
                              controller.remainingTime.value,
                            ),
                            style: TextStyle(
                              fontSize: 22,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          SizedBox(

                            child: CustomTextButton(
                              text: "Stop Timer",
                              onPressed: () => {controller.reset(), Get.back()},
                              buttonColor: AppColors.PrimaryColor,

                              textColor: Colors.white,
                            ),
                          ),
                        ],
                      ),
                    );
                  }
                  return SizedBox.shrink();
                }),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
