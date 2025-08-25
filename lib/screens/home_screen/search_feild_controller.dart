import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:online_calculator_hub/utils/Constants/toolsTexts.dart';

import '../../data/models/tools_model.dart';
import '../../screens/age_calculator/age_calculator_view.dart';
import '../../screens/bmi_calculator/bmi_calculator_view.dart';
import '../../screens/calories_calculator/calories_calculator_view.dart';
import '../../screens/case_convertor/case_convertor_view.dart';
import '../../screens/countdown_timer/countdown_timer_view.dart';
import '../../screens/date_difference/date_difference_view.dart';
import '../../screens/length_convertor/length_convertor_view.dart';
import '../../screens/password_generator/password_generator_view.dart';
import '../../screens/temperature_convertor/temperature_convertor_view.dart';
import '../../screens/water_intake/water_intake_view.dart';
import '../../screens/weight_convertor/weight_convertor_view.dart';
import '../../screens/word_counter/word_counter_view.dart';

class SearchFeildController extends GetxController {
  var query = ''.obs;


  final List<ToolItem> allTools = [
    ToolItem(title: Toolstexts.BMI, icon: Icons.health_and_safety, onTap: () => Get.to(() => BmiCalculatorView(title: Toolstexts.BMI),)),
    ToolItem(title: Toolstexts.Calorie_Calculator, icon: Icons.health_and_safety, onTap: () => Get.to(() => CaloriesCalculatorView(title: Toolstexts.Calorie_Calculator))),
    ToolItem(title: Toolstexts.water_intake, icon: Icons.local_drink, onTap: () => Get.to(() => WaterIntakeView(title: Toolstexts.water_intake))),
    ToolItem(title: Toolstexts.age_Calculator, icon: Icons.calendar_month, onTap: () => Get.to(() => AgeCalculatorView(title: Toolstexts.age_Calculator))),
    ToolItem(title: Toolstexts.date_difference, icon: Icons.date_range, onTap: () => Get.to(() => DateDifferenceView(title: Toolstexts.date_difference))),
    ToolItem(title: Toolstexts.countdown_calculator, icon: Icons.timer, onTap: () => Get.to(() => CountdownTimerView(title: Toolstexts.countdown_calculator))),
    ToolItem(title: Toolstexts.Lenght_converter, icon: Icons.straighten, onTap: () => Get.to(() => LengthConvertorView(title: Toolstexts.Lenght_converter))),
    ToolItem(title: Toolstexts.Weight_converter, icon: Icons.monitor_weight, onTap: () => Get.to(() => WeightConvertorView(title: Toolstexts.Weight_converter))),
    ToolItem(title: Toolstexts.Temperature_Converter, icon: Icons.thermostat, onTap: () => Get.to(() => TemperatureConvertorView(title: Toolstexts.Temperature_Converter))),
    ToolItem(title: Toolstexts.word_counter, icon: Icons.text_fields, onTap: () => Get.to(() => WordCounterView(title: Toolstexts.word_counter))),
    ToolItem(title: Toolstexts.Case_Converter, icon: Icons.swap_horiz, onTap: () => Get.to(() => CaseConvertorView(title: Toolstexts.Case_Converter))),
    ToolItem(title: Toolstexts.Password_Generator, icon: Icons.password, onTap: () => Get.to(() => PasswordGeneratorView(title: Toolstexts.Password_Generator))),
  ];
  void setQuery(String val) {
    query.value = val;

    if (val.isEmpty) {
      filteredTools.clear();
    } else {
      filteredTools.value = allTools
          .where((tool) => tool.title.toLowerCase().contains(val.toLowerCase()))
          .toList();
    }
  }
  RxList<ToolItem> filteredTools = <ToolItem>[].obs;


}



