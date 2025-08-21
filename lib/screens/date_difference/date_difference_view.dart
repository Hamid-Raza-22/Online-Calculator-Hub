import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:online_calculator_hub/screens/date_difference/date_difference%20_controller.dart';
import 'package:online_calculator_hub/utils/Constants/colors.dart';
import 'package:online_calculator_hub/widgets/custom_date_time_field.dart';
import 'package:online_calculator_hub/widgets/custom_text.dart';
import 'package:online_calculator_hub/widgets/custom_check_box.dart';
import 'package:online_calculator_hub/widgets/custom_app_bar.dart';
import 'package:online_calculator_hub/widgets/custom_button.dart';

class DateDifferenceView extends StatelessWidget {
  final DateController dateController = Get.put(DateController());
  final String title;

  DateDifferenceView({super.key, required this.title});

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
              CustomDateField(
                label: "Start Date",
                onChanged: (date) {
                  dateController.setStartDate(date!);
                },
              ),
              CustomDateField(
                label: "End Date",
                onChanged: (date) {
                  dateController.setEndDate(date!);
                },
              ),
              Obx(
                () => CheckBoxWidget(
                  title: "Include end date in calculation",
                  value: dateController.includeEndDate.value,
                  onChanged: (value) {
                    dateController.toggleIncludeEndDate(value!);
                  },
                ),
              ),
              SizedBox(height: 10),
              CustomTextButton(
                text: "Calculate Difference",
                onPressed: () {
                  dateController.calculateDifference();
                  Get.defaultDialog(
                    title: "Date Difference",
                    titleStyle: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: AppColors.PrimaryColor,
                    ),

                    middleText:
                        "Years:  ${dateController.diffyears}\n"
                        "Months: ${dateController.diffMonths}\n"
                        "Days: ${dateController.diffDays}",
                    confirm: SizedBox(
                      width: 70,
                      child: CustomTextButton(
                        text: "Ok",
                        onPressed: () => {dateController.reset(), Get.back()},
                        buttonColor: AppColors.PrimaryColor,
                        size: 80,
                        textColor: Colors.white,
                      ),
                    ),
                  );
                },
                buttonColor: AppColors.PrimaryColor,
                textColor: Colors.white,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
