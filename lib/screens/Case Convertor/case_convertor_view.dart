import 'package:flutter/material.dart';
import 'package:online_calculator_hub/utils/Constants/colors.dart';
import 'package:online_calculator_hub/widgets/CustomMultiLineInput.dart';
import 'package:online_calculator_hub/widgets/customAppBar.dart';
import 'package:online_calculator_hub/widgets/custom_button.dart';


class CaseConvertorView extends StatelessWidget {
  final String title;
  const CaseConvertorView({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(bgColor: AppColors.PrimaryColor, iconColor: Colors.white, title: title),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            spacing: 10,
            children: [
              CustomMultiLineField(label: "Input Text", hint: 'Enter text to convert......'),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  CustomTextButton(text: "UPPERCASE", onPressed: (){}, buttonColor: AppColors.PrimaryColor,size: 100,textColor: Colors.white,),
                  CustomTextButton(text: "lowercase", onPressed: (){}, buttonColor: Colors.green,size: 100,textColor: Colors.white,),
                  CustomTextButton(text: "Title Case", onPressed: (){}, buttonColor: Colors.purpleAccent,size: 100,textColor: Colors.white,),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  CustomTextButton(text: "Sentence case", onPressed: (){}, buttonColor: Colors.deepOrange,size: 100,textColor: Colors.white,),
                  CustomTextButton(text: "aLtErNaTinG", onPressed: (){}, buttonColor: Colors.pinkAccent,size: 100,textColor: Colors.white,),
                  CustomTextButton(text: "iNVERSE", onPressed: (){}, buttonColor: Colors.black26,size: 100,textColor: Colors.white,),
                ],
              ),
              CustomMultiLineField(label: "Converted Text", hint: "Converted text show here......."),
              Row(

                mainAxisAlignment: MainAxisAlignment.spaceBetween,

                children: [
                  CustomTextButton(text: "Copy Result", onPressed: (){}, buttonColor: AppColors.PrimaryColor,textColor: Colors.white,size: 155,),
                  CustomTextButton(text: "Clear All", onPressed: (){}, buttonColor: Colors.grey,textColor: Colors.white,size: 155,)

                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
