import 'package:flutter/cupertino.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

class LengthConverterController extends GetxController {
  final lengthValue=TextEditingController();
  var fromLengthUnit = 'Meter(m)'.obs;
  var showResult=false.obs;
  var clicked=false.obs;
  var toLengthUnit = 'Foot'.obs;
  var result = ''.obs;
  final allUnits =[
    'Meter(m)',
    'Kilometer(km)',
    'centimeter(cm)',
    'Milimeter(mm)',
    'Mile',
    'Yard',
    'Foot',
    'Inch',
  ];
  List<String> get fromLengthUnitList => allUnits.where((u) => u != toLengthUnit.value).toList();
  List<String> get toLengthUnitList => allUnits.where((u) => u != fromLengthUnit.value).toList();
  void setSelectedTo(String newValue){
    toLengthUnit.value=newValue;
  }
  void setSelectedFrom(String newValue){
    fromLengthUnit.value=newValue;

  }


  @override
  void onInit() {
    super.onInit();
    lengthValue.addListener((){
      clicked.value=false;
      showResult.value=false;
    });
  }
  void copyResult() {
    if (fromLengthUnit.value.isNotEmpty) {
      Clipboard.setData(ClipboardData(text:result.value));
      Get.snackbar(
        "Copied",
        "Length result copied to clipboard",
        snackPosition: SnackPosition.BOTTOM,
      );
    }
  }

  final Map<String, double> conversionFactors = {
    'Meter(m)': 1.0,
    'Kilometer(km)': 1000.0,
    'centimeter(cm)': 0.01,
    'Milimeter(mm)': 0.001,
    'Mile': 1609.34,
    'Yard': 0.9144,
    'Foot': 0.3048,
    'Inch': 0.0254,
  };

  void convert() {
    var value=double.tryParse(lengthValue.text)?? 0.0;

    double fromFactor = conversionFactors[fromLengthUnit.value] ?? 1.0;
    double toFactor = conversionFactors[toLengthUnit.value] ?? 1.0;

    double convertedValue = value * (fromFactor / toFactor);


    result.value = convertedValue.toStringAsFixed(3);
  }

  void reset() {
    lengthValue.clear();
    fromLengthUnit.value = 'Meter(m)';
    toLengthUnit.value = 'Foot';
    result.value = '';
    clicked.value=false;
  }
}
