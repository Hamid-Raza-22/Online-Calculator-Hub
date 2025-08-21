import 'package:flutter/material.dart';
import 'package:online_calculator_hub/utils/Constants/colors.dart';
import 'package:online_calculator_hub/widgets/custom_text.dart';
import 'package:online_calculator_hub/widgets/custom_app_bar.dart';
import 'package:online_calculator_hub/widgets/custom_check_box.dart';
import 'package:online_calculator_hub/widgets/custom_slider.dart';
import 'package:online_calculator_hub/widgets/custom_button.dart';


class PasswordGeneratorView extends StatelessWidget {
  final String title;
  const PasswordGeneratorView({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(bgColor: AppColors.PrimaryColor, iconColor: Colors.white, title: title),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            spacing: 10,
            children: [
             Column(
               children: [
                 Customslider(),
                 CheckBoxWidget(title: 'Include Uppercase Letters (A-Z)',value: true,),
                 CheckBoxWidget(title: 'Include Lowercase Letters (a-z)',value: true,),
                 CheckBoxWidget(title: 'Include Numbers (0-9)',value: true,),
                 CheckBoxWidget(title: 'Include Symbols (!@#\$%^&*)',value: true,),
               ],
             ),
              SizedBox(height: 10,),
              CustomTextButton(text: "Generate Password", onPressed: (){}, buttonColor: AppColors.PrimaryColor,textColor:Colors.white,),
              TextWidget(text: "Password Strength Tips:", fontSize: 18, weight: FontWeight.w600),
              TextWidget(text: "Use at least 12 characters for better security\nInclude a mix of uppercase, lowercase, numbers, and symbol\nAvoid common words or personal information\nUse unique passwords for each account\nConsider using a password manager", fontSize: 16, weight: FontWeight.normal)
            ],
          ),
        ),
      ),
    );
  }
}
