import 'package:flutter/material.dart';
import 'package:get/get.dart';

class TemperatureController extends GetxController {

final inputController = TextEditingController();


  var fromUnit = "Celcius(C)".obs;
  var toUnit = "Fahrenheit(F)".obs;

  var result = 0.0.obs;

  void setFromUnit(String value) {
    fromUnit.value = value;
    convert();
  }

  void setToUnit(String value) {
    toUnit.value = value;
    convert();
  }

  void convert() {
    double input = double.tryParse(inputController.text) ?? 0.0;

    double inCelsius = input;


    if (fromUnit.value == "Fahrenheit(F)") {
      inCelsius = (input - 32) * 5 / 9;
    } else if (fromUnit.value == "Kelvin(k)") {
      inCelsius = input - 273.15;
    }

    double output = inCelsius;
    if (toUnit.value == "Fahrenheit(F)") {
      output = (inCelsius * 9 / 5) + 32;
    } else if (toUnit.value == "Kelvin(k)") {
      output = inCelsius + 273.15;
    }

    result.value = output;
  }

  void reset() {
    inputController.clear();
    fromUnit.value = "Celcius(C)";
    toUnit.value = "Fahrenheit(F)";
    result.value = 0.0;
  }
}
