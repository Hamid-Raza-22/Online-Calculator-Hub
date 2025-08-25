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
  final _formKey = GlobalKey<FormState>();
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
          child: Form(
            key: _formKey,
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
                    if (_formKey.currentState!.validate()) {
                      dateController.calculateDifference();
                      dateController.showResult.value = true;
                    }
                  },
                  buttonColor: AppColors.PrimaryColor,
                  textColor: Colors.white,
                ),
                Obx(() {
                  if (dateController.showResult.value) {
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
                            "Date Difference",
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 18,
                              color: AppColors.PrimaryColor,
                            ),
                          ),
                          const SizedBox(height: 8),
                          Text("Years:  ${dateController.diffyears}"),
                          Text("Months: ${dateController.diffMonths}"),
                          Text("Days: ${dateController.diffDays}"),
                          Padding(
                            padding: const EdgeInsets.symmetric(vertical: 16.0),
                            child: SizedBox(
                              width: 100,
                              child: CustomTextButton(
                                text: "Ok",
                                onPressed: () => {
                                  dateController.reset(),
                                },
                                buttonColor: AppColors.PrimaryColor,
                                size: 80,
                                textColor: Colors.white,
                              ),
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
