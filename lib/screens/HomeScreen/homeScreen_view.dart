import 'package:flutter/material.dart';
import 'package:online_calculator_hub/utils/Constants/colors.dart';
import 'package:online_calculator_hub/widgets/Text_widget.dart';
import 'package:online_calculator_hub/widgets/custom_grid_view.dart';

import '../../widgets/customSearchFeild.dart';

class HomescreenView extends StatelessWidget {
  const HomescreenView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: TextWidget(
          text: "All-in-One Online Calculators",
          fontSize: 22,
          weight: FontWeight.w600,
          textcolor: Colors.white,),
        backgroundColor: AppColors.PrimaryColor,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.only(top: 16.0, left: 20.0, right: 16),
          child: Column(
            spacing: 10,
            children: [

              TextWidget(
                  text: "Free, fast, and accurate calculator tools for all your daily needs",
                  fontSize: 18,
                  weight:FontWeight.w600,
              textcolor: AppColors.PrimaryColor,),

              CustomSearchField(
                hintText: "Search Calculators...", icon: Icons.search,),
              CustomGridView()

            ],
          ),
        ),
      ),
    );
  }
}
