import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:online_calculator_hub/screens/countdown_timer/countdown_timer_controller.dart';
import 'package:online_calculator_hub/utils/Constants/colors.dart';
import 'package:online_calculator_hub/widgets/custom_date_time_field.dart';
import 'package:online_calculator_hub/widgets/custom_input_field.dart';
import 'package:online_calculator_hub/widgets/custom_app_bar.dart';
import 'package:online_calculator_hub/widgets/custom_result_container.dart';
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
                  controller: controller.startController,
                  onChanged: (date) {
                    controller.setDate(date);
                    controller.showResult.value=false;
                    controller.clicked.value=false;
                    controller.eventPassed.value=false;
                  },
                ),
                CustomTimeSelectionField(
                  label: "Event Time",
                  controller: controller.timeController,

                  onChanged: (time) {
                    controller.setTime(time);
                    controller.showResult.value = false;
                    controller.clicked.value = false;
                    controller.eventPassed.value=false;
                  },
                ),
                Obx(
                  ()=> CustomTextButton(
                    text: controller.clicked.value
                        ? "Countdown Started":"Start Countdown",
                    onPressed: () {
                      if (_formKey.currentState!.validate()) {
                        controller.startCountdown();
                        FocusScope.of(context).unfocus();
                        controller.showResult.value = true;
                        controller.clicked.value = true;
                      }
                    },
                    buttonColor: controller.clicked.value
                        ? Colors.green
                        : AppColors.PrimaryColor,
                    textColor: Colors.white,
                  ),
                ),
                Obx(() {
                  if (controller.showResult.value) {
                    return CustomResultContainer(
                      title: controller.eventPassed.value
                          ?
                      "Event has Passed!": controller.eventNameController.text ,
                      counterText: controller.formatDuration(
                        controller.remainingTime.value,
                      ),
                      resetText: controller.eventPassed.value ?"Reset" :"Stop Timer" ,

                      optionalSize: 290,
                      reset: (){
                          controller.reset();
                      },
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
