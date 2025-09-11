import 'package:flutter/material.dart';

import '../utils/Constants/colors.dart';
import 'custom_button.dart';

class CustomResultContainer extends StatelessWidget {
  final String title;
  final String? text1;
  final double? optionalSize;
  final String? text2;
  final String? clipboardText;
  final String resetText;
  final String? counterText;
  final String? text3;
  final String? text4;
  final String? text5;
  final VoidCallback? clipBoardFunction;
  final VoidCallback reset;

  const CustomResultContainer({
    super.key,
    required this.title,
     this.text1,
    this.text2,
    this.text3,
    this.clipboardText,
    required this.resetText,
     this.clipBoardFunction,
    required this.reset,
    this.text4, this.counterText, this.text5, this.optionalSize=100,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 350,
      margin: const EdgeInsets.only(top: 20),
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.grey.shade200,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: AppColors.PrimaryColor),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Center(
            child: Text(
              title,
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 18,
                color: AppColors.PrimaryColor,
              ),
            ),
          ),
          const SizedBox(height: 8),
          if(text1 !=null)Text(text1!, style: TextStyle(fontWeight: FontWeight.w600)),
          if(text2 !=null)Text(text2!, style: TextStyle(fontWeight: FontWeight.w600)),
          if(text3 !=null)Text(text3!, style: TextStyle(fontWeight: FontWeight.w600)),
          if(text4 !=null)Text(text4!, style: TextStyle(fontWeight: FontWeight.w600)),
          if(text5 !=null)Text(text5!, style: TextStyle(fontWeight: FontWeight.w600)),
          if(counterText !=null)Center(child: Text(counterText!, style: TextStyle(fontWeight: FontWeight.bold,fontSize: 22
          ),)),
          SizedBox(height: 10,),

          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              if(clipboardText !=null && clipBoardFunction !=null)
              CustomTextButton(
                text: clipboardText!,
                onPressed: clipBoardFunction!,
                buttonColor: AppColors.PrimaryColor,
                size: 150,

                textColor: Colors.white,
              ),
              CustomTextButton(
                text: resetText,
                onPressed: reset,
                size: optionalSize!,
                buttonColor: Colors.grey,
                textColor: Colors.white,
              ),
            ],
          ),
        ],
      ),
    );
  }
}
