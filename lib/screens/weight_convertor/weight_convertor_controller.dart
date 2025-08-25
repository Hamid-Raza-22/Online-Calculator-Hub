import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class WeightController extends GetxController {

  final inputValue=TextEditingController();


  var fromUnit = 'Kilogram(kg)'.obs;
  var showResult=false.obs;
  var toUnit = 'Pound(Ib)'.obs;

  void setSelectedFrom(String? value){
    if(value !=null){
      fromUnit.value=value;
    }
  }
  void setSelectedTo(String? value){
    if(value !=null){
      fromUnit.value=value;
    }
  }

  var result = ''.obs;


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

    double inKg = value * (unitToKg[fromUnit.value] ?? 1.0);

    double converted =
        inKg / (unitToKg[toUnit.value] ?? 1.0);

    result.value = "$value ${fromUnit.value} = ${converted.toStringAsFixed(4)} ${toUnit.value}";
  }

  void reset() {
    inputValue.clear();
    fromUnit.value = 'Meter(m)';
    toUnit.value = 'Foot';
    result.value = '';
  }
}
