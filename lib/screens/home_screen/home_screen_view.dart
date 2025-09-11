import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:online_calculator_hub/utils/Constants/colors.dart';
import 'package:online_calculator_hub/widgets/custom_text.dart';
import 'package:online_calculator_hub/widgets/custom_grid_container.dart';
import '../../widgets/custom_search_field.dart';
import 'package:online_calculator_hub/screens/home_screen/search_feild_controller.dart';

class HomeScreenView extends StatelessWidget {
  const HomeScreenView({super.key});

  @override
  Widget build(BuildContext context) {
    final searchFieldController=Get.put(SearchFeildController());

    return Scaffold(
      appBar: AppBar(
        title: TextWidget(
          text: "All-in-One Online Calculators",
          fontSize: 22,
          weight: FontWeight.w600,
          textcolor: Colors.white,
        ),
        backgroundColor: AppColors.PrimaryColor,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            spacing: 10,
            children: [
              TextWidget(
                text: "Free, fast, and accurate calculator tools for all your daily needs",
                fontSize: 18,
                weight: FontWeight.w600,
                textcolor: AppColors.PrimaryColor,
              ),


              CustomSearchField(
                hintText: "Search Calculators...",
                icon: Icons.search,
                onChanged: (val) => searchFieldController.setQuery(val),
              ),

              Obx(() {
                if (searchFieldController.filteredTools.isEmpty &&
                    searchFieldController.query.value.isNotEmpty) {
                  return const Text("No results found");
                }

                if (searchFieldController.filteredTools.isNotEmpty) {
                  return Column(
                    children: searchFieldController.filteredTools.map((tool) {
                      return ListTile(
                        leading: Icon(tool.icon, color: AppColors.PrimaryColor),
                        title: Text(tool.title),
                        onTap: tool.onTap,
                      );
                    }).toList(),
                  );
                }


                return const CustomGridView();
              }),
            ],
          ),
        ),
      ),
    );
  }
}

