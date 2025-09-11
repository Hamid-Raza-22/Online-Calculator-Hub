import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:online_calculator_hub/utils/Constants/colors.dart';
import 'package:online_calculator_hub/widgets/custom_date_time_field.dart';
import 'package:online_calculator_hub/widgets/custom_result_container.dart';
import 'package:online_calculator_hub/widgets/custom_text.dart';
import 'package:online_calculator_hub/widgets/custom_check_box.dart';
import 'package:online_calculator_hub/widgets/custom_app_bar.dart';
import 'package:online_calculator_hub/widgets/custom_button.dart';

import 'date_difference_controller.dart';

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
                    controller: dateController.startController,

                    onChanged: (date) {
                      dateController.setStartDate(date!);
                      dateController.clicked.value=false;
                      dateController.showResult.value=false;
                    },
                  ),

               CustomDateField(
                    label: "End Date",
                    controller: dateController.calculateOnController,
                    onChanged: (date) {
                      dateController.setEndDate(date!);
                      dateController.clicked.value=false;
                      dateController.showResult.value=false;
                    },
                  ),

                Obx(
                  () => CheckBoxWidget(
                    title: "Include end date in calculation",
                    value: dateController.includeEndDate.value,
                    onChanged: (value) {
                      dateController.toggleIncludeEndDate(value!);
                      dateController.showResult.value=false;
                      dateController.clicked.value=false;
                    },
                  ),
                ),
                SizedBox(height: 10),
                Obx(
                  ()=> CustomTextButton(
                    text: dateController.clicked.value ? "Calculated":"Calculate Difference",
                    onPressed: () {
                      if (_formKey.currentState!.validate()) {
                        dateController.calculateDifference();
                        FocusScope.of(context).unfocus();
                        dateController.showResult.value = true;
                        dateController.clicked.value=true;
                      }
                    },
                    buttonColor: dateController.clicked.value ? Colors.green: AppColors.PrimaryColor,
                    textColor: Colors.white,
                  ),
                ),
                Obx(() {
                  if (dateController.showResult.value) {
                    return CustomResultContainer(title: "Date Difference",text1:"Years:  ${dateController.diffyears}",text2: "Months: ${dateController.diffMonths}",text3: "Days: ${dateController.diffDays}",clipboardText:"Copy to Clipboard",clipBoardFunction: (){
                      dateController.copyResult();
                    }, resetText:"Reset", reset:(){
                      dateController.reset();
                      dateController.showResult.value=false;
                    });
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
