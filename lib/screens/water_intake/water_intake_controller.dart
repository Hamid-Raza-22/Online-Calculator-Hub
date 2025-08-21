import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class WaterIntakeController extends GetxController {
  final weightController = TextEditingController();
  final exerciseMinutesController = TextEditingController();
  var selectedClimate = "Normal/Moderate".obs;
  var result = "".obs;
  void setSelectedclimate(String? newValue){
    if(newValue !=null){
      selectedClimate.value=newValue;
    }

  }
  void calculateWaterIntake() {
    final weight=double.tryParse(weightController.text) ?? 0.0;
    final exerciseMinutes=double.tryParse(exerciseMinutesController.text)?? 0.0;

    double base = weight * 0.03;
    double exerciseBonus = (exerciseMinutes / 30) * 0.35;
    double climateBonus = 0.0;

    if (selectedClimate.value == "Hot/Humid") climateBonus = 0.5;
    if (selectedClimate.value == "Cold/Dry") climateBonus = 0.2;

    double total = base + exerciseBonus + climateBonus;

    result.value = """${total.toStringAsFixed(1)} Liters/day
Approximately:
${(total / 0.25).round()} glasses (250ml each)

Base intake: ${base.toStringAsFixed(1)}L
Exercise bonus: ${exerciseBonus.toStringAsFixed(1)}L
Climate bonus: ${climateBonus.toStringAsFixed(1)}L
""";
  }



  void reset(){
    weightController.clear();
    exerciseMinutesController.clear();
     selectedClimate.value = "Normal/Moderate".obs as String;
    result.value = "".obs as String;
  }
}
