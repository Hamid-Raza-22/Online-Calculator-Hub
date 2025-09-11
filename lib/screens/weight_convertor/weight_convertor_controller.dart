import 'package:flutter/cupertino.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

class WeightController extends GetxController {

  final inputValue=TextEditingController();
  var fromWeightUnit = 'Kilogram(kg)'.obs;
  var showResult=false.obs;
  var toWeightUnit = 'Pound(Ib)'.obs;
  var clicked=false.obs;
  var result = ''.obs;
  final allUnits =[
    'Kilogram(kg)',
    'Gram(g)',
    'Milligram(mg)',
    'Pound(Ib)',
    'Metric Ton',
    'Stone',
    'Ounce(oz)',
  ];
  List<String> get fromWeightUnitList => allUnits.where((u) => u != toWeightUnit.value).toList();
  List<String> get toWeightUnitList => allUnits.where((u) => u != fromWeightUnit.value).toList();
  void setSelectedWeightFrom(String value){

      fromWeightUnit.value=value;
  }
  void setSelectedWeightTo(String value){

      toWeightUnit.value=value;
  }

@override
  void onInit() {

    super.onInit();
    inputValue.addListener((){
      showResult.value=false;
      clicked.value=false;
    });

  }


  final Map<String, double> unitToKg = {
    'Kilogram(kg)': 1.0,
    'Gram(g)': 0.001,
    'Milligram(mg)': 0.000001,
    'Pound(Ib)': 0.453592,
    'Metric Ton': 1000.0,
    'Stone': 6.35029,
    'Ounce(oz)': 0.0283495,
  };

  void convert() {

    var value=double.tryParse(inputValue.text)?? 0.0;

    double inKg = value * (unitToKg[fromWeightUnit.value] ?? 1.0);

    double converted =
        inKg / (unitToKg[toWeightUnit.value] ?? 1.0);

    result.value = converted.toStringAsFixed(4);
  }
  void copyResult() {
    if (fromWeightUnit.value.isNotEmpty) {
      Clipboard.setData(ClipboardData(text:result.value));
      Get.snackbar(
        "Copied",
        "weight result copied to clipboard",
        snackPosition: SnackPosition.BOTTOM,
      );
    }
  }
  void reset() {
    inputValue.clear();
    fromWeightUnit.value ='Kilogram(kg)';
    toWeightUnit.value = 'Pound(Ib)';
    result.value = '';
    clicked.value=false;
  }
}
