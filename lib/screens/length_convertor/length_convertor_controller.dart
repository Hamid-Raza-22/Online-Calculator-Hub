import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class LengthConverterController extends GetxController {
  final lengthValue=TextEditingController();
  var fromUnit = 'Meter(m)'.obs;
  var toUnit = 'Foot'.obs;
  var result = ''.obs;

  void setSelectedFrom(String? newValue){
    if(newValue !=null){
      print('fromunit:${newValue}');
      fromUnit.value=newValue;

    }

  }

  void setSelectedTo(String? newValue){
    if(newValue !=null){
      print('tounit:${newValue}');
      toUnit.value=newValue;
    }

  }
  final Map<String, double> conversionFactors = {
    'Meter(m)': 1.0,
    'Kilometer(km)': 1000.0,
    'centimeter(cm)': 0.01,
    'Milieter(mm)': 0.001,
    'Mile': 1609.34,
    'Yard': 0.9144,
    'Foot': 0.3048,
    'Inch': 0.0254,
  };

  void convert() {
    var value=double.tryParse(lengthValue.text)?? 0.0;

    double fromFactor = conversionFactors[fromUnit.value] ?? 1.0;
    double toFactor = conversionFactors[toUnit.value] ?? 1.0;

    double convertedValue = value * (fromFactor / toFactor);
    print(fromUnit);
    print(toUnit);
    print(toFactor);
    print(fromFactor);

    result.value = "${convertedValue.toStringAsFixed(3)} ${toUnit.value}";
  }

  void reset() {
    lengthValue.clear();
    fromUnit.value = 'Meter(m)';
    toUnit.value = 'Foot';
    result.value = '';
  }
}
