import 'package:flutter/material.dart';
import 'package:online_calculator_hub/utils/Constants/colors.dart';
import 'package:online_calculator_hub/widgets/CustomInputFeild.dart';
import 'package:online_calculator_hub/widgets/customAppBar.dart';
import 'package:online_calculator_hub/widgets/customDropdown.dart';
import 'package:online_calculator_hub/widgets/custom_button.dart';


class TemperatureConvertorView extends StatelessWidget {
  final String title;
  const TemperatureConvertorView({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:CustomAppBar(bgColor: AppColors.PrimaryColor, iconColor: Colors.white, title: title),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          spacing: 10,
          children: [
            CustomInputField(label: "Temperature", hintText:'0'),
            CustomDropdown(label: "From", value:'Celcius(C)', items: ['Celcius(C)','Fahrenheit(F)','Kelvin(k)'], onChanged: (value) => (){},),
            CustomDropdown(label: "To", value:'Fahrenheit(F)', items: ['Celcius(C)','Fahrenheit(F)','Kelvin(k)'], onChanged: (value) => (){},),
            CustomTextButton(text: "Convert", onPressed: (){}, buttonColor: AppColors.PrimaryColor,textColor: Colors.white,)
          ],
        ),
      ),
    );
  }
}
