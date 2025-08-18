import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:online_calculator_hub/widgets/Text_widget.dart';
import 'package:online_calculator_hub/widgets/customTextFeild.dart';
import 'package:online_calculator_hub/widgets/custom_button.dart';

class BmiCalculatorView extends StatelessWidget {
  final String title;
  const BmiCalculatorView({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              spacing: 10,
              children: [
                TextWidget(text: "BMI Calculator",weight: FontWeight.bold,fontSize: 22,),
                TextWidget(
                  text: "Calculate your Body Mass Index (BMI) to determine if your weight is "
                      "in a healthy range for your height.",
                  fontSize: 16,
                  weight: FontWeight.normal,
      
                ),
                CustomTextField( hintText:"170",labelText: "Height",),
                CustomTextField(hintText:"65", labelText: "Weight",),
                CustomTextButton(text: "Calculate BMI", textColor:Colors.white,onPressed: (){
                  Get.defaultDialog(
                    title: "Your BMI",
                    middleText: "Normal with weight: 76, height: 182",
                    confirm: ElevatedButton(
                      onPressed: () => Get.back(),
                      child: Text("OK"),
                    ),
                    cancel: TextButton(
                      onPressed: () => Get.back(),
                      child: Text("Cancel"),
                    ),

                  );
                },buttonColor: Colors.blueAccent,),
                CustomTextButton(text: "Reset", onPressed: (){},buttonColor: Colors.grey,textColor: Colors.black,),
                SizedBox(height: 10,),
                TextWidget(text: "Understanding BMI", fontSize: 22, weight: FontWeight.bold),
                TextWidget(text: "Body Mass Index (BMI) is a simple calculation using height and weight to estimate body fat and assess health risks. While not perfect, it's a useful screening tool for weight categories.", fontSize:16, weight: FontWeight.normal),
                TextWidget(text: "BMI Categories:", fontSize:18, weight: FontWeight.w600),
                TextWidget(text: "Underweight: BMI < 18.5", fontSize: 16, weight: FontWeight.normal),
                TextWidget(text: "Normal weight: BMI 18.5-24.9", fontSize: 16, weight: FontWeight.normal),
                TextWidget(text: "Overweight: BMI 25-29.9", fontSize: 16, weight: FontWeight.normal),
                TextWidget(text: "Obese: BMI ≥ 30", fontSize: 16, weight: FontWeight.normal)
      
      
              ],
            ),
          ),
        ),
      ),
    );
  }
}
