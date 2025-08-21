import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:online_calculator_hub/screens/temperature_convertor/temperature_convertor_controller.dart';
import 'package:online_calculator_hub/utils/Constants/colors.dart';
import 'package:online_calculator_hub/widgets/custom_input_field.dart';
import 'package:online_calculator_hub/widgets/custom_app_bar.dart';
import 'package:online_calculator_hub/widgets/custom_drop_down.dart';
import 'package:online_calculator_hub/widgets/custom_button.dart';


class TemperatureConvertorView extends StatelessWidget {
  final TemperatureController temperatureController=Get.put(TemperatureController());
  final String title;
  TemperatureConvertorView({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:CustomAppBar(bgColor: AppColors.PrimaryColor, iconColor: Colors.white, title: title),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          spacing: 10,
          children: [
            CustomInputField(label: "Temperature", hintText:'0',controller: temperatureController.inputController,),
            CustomDropdown(label: "From", value:'Celcius(C)', items: ['Celcius(C)','Fahrenheit(F)','Kelvin(k)'], onChanged: (value){
              temperatureController.setFromUnit(value!);
            },),
            CustomDropdown(label: "To", value:'Fahrenheit(F)', items: ['Celcius(C)','Fahrenheit(F)','Kelvin(k)'], onChanged: (value) {
              temperatureController.setToUnit(value!);
            },),
            CustomTextButton(text: "Convert", onPressed: (){

              temperatureController.convert();
              Get.defaultDialog(
                title: "Your Converted Values",
                titleStyle: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: AppColors.PrimaryColor,
                ),

                middleText:
                "From: ${temperatureController.inputController.text.toString()} ${temperatureController.fromUnit} \n"
                    "To: ${temperatureController.toUnit}\n"
                    "converted value: ${temperatureController.result} \n",
                confirm: SizedBox(
                  width: 70,
                  child: CustomTextButton(
                    text: "Ok",
                    onPressed: () => {temperatureController.reset(), Get.back()},
                    buttonColor: AppColors.PrimaryColor,
                    size: 80,
                    textColor: Colors.white,
                  ),
                ),
              );

            }, buttonColor: AppColors.PrimaryColor,textColor: Colors.white,)
          ],
        ),
      ),
    );
  }
}
