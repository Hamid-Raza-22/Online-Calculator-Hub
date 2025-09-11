import 'package:flutter/cupertino.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

class WaterIntakeController extends GetxController {
  final weightController = TextEditingController();
  final exerciseMinutesController = TextEditingController();
  var selectedClimate = "Normal/Moderate".obs;
  var result = "".obs;
  var clicked=false.obs;
  var baseIntake="".obs;
  var climateBonus="".obs;
  var exerciseIntake="".obs;
  var total=0.0.obs;
  var showResult=false.obs;

  @override
  void onInit() {
    super.onInit();
    exerciseMinutesController.addListener(() {
      clicked.value = false;
      showResult.value=false;
    });
    weightController.addListener(() {
      clicked.value = false;
      showResult.value=false;
    });
  }

  void setSelectedClimate(String? newValue){
    if(newValue !=null){
      selectedClimate.value=newValue;
    }

  }
  void calculateWaterIntake() {
    final weight = double.tryParse(weightController.text) ?? 0.0;
    final exerciseMinutes = double.tryParse(exerciseMinutesController.text) ?? 0.0;


    double base = weight * 0.035;


    double exerciseBonus = (exerciseMinutes / 30) * 0.7;


    double climateBonus = 0.0;
    if (selectedClimate.value == "Hot/Humid") climateBonus = 0.7;
    if (selectedClimate.value == "Cold/Dry") climateBonus = 0.3;

    total.value = base + exerciseBonus + climateBonus;

    baseIntake.value = base.toStringAsFixed(1);
    exerciseIntake.value = exerciseBonus.toStringAsFixed(1);
    result.value = total.value.toStringAsFixed(1);
  }

  void copyResult() {
    if (result.value.isNotEmpty) {
      Clipboard.setData(ClipboardData(text:"${result.value} Litters/day\nApproximately:${(total / 0.25).round()} glasses (250ml each)"));
      Get.snackbar(
        "Copied",
        "water intake result copied to clipboard",
        snackPosition: SnackPosition.BOTTOM,
      );
    }
  }


  void reset(){
    weightController.clear();
    exerciseMinutesController.clear();
     selectedClimate.value = "Normal/Moderate";
    result.value = "";
    clicked.value=false;
    showResult.value=false;
  }
}
