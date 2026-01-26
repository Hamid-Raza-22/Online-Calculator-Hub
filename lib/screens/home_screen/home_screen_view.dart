import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:online_calculator_hub/utils/Constants/colors.dart';
import 'package:online_calculator_hub/widgets/custom_text.dart';
import 'package:online_calculator_hub/widgets/custom_grid_container.dart';
import '../../widgets/custom_search_field.dart';
import 'package:online_calculator_hub/screens/home_screen/search_feild_controller.dart';
import 'package:online_calculator_hub/screens/webview/webview_screen.dart';

class HomeScreenView extends StatelessWidget {
  const HomeScreenView({super.key});

  @override
  Widget build(BuildContext context) {
    final searchFieldController=Get.put(SearchFeildController());

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: TextWidget(
          text: "All-in-One Online Calculators",
          fontSize: 22,
          weight: FontWeight.w600,
          textcolor: Colors.white,
        ),
        backgroundColor: AppColors.PrimaryColor,
        actions: [
          PopupMenuButton<String>(
            icon: const Icon(Icons.more_vert, color: Colors.white),
            onSelected: (value) {
              switch (value) {
                case 'privacy':
                  Get.to(() => const WebViewScreen(
                        title: 'Privacy Policy',
                        url: 'https://onlinecalculatorshub.com/privacy-policy.html',
                      ));
                  break;
                case 'terms':
                  Get.to(() => const WebViewScreen(
                        title: 'Terms & Conditions',
                        url: 'https://onlinecalculatorshub.com/terms.html',
                      ));
                  break;
                case 'about':
                  Get.to(() => const WebViewScreen(
                        title: 'About Us',
                        url: 'https://onlinecalculatorshub.com/about.html',
                      ));
                  break;
                case 'contact':
                  Get.to(() => const WebViewScreen(
                        title: 'Contact Us',
                        url: 'https://onlinecalculatorshub.com/contact.html',
                      ));
                  break;
              }
            },
            itemBuilder: (BuildContext context) => [
              const PopupMenuItem<String>(
                value: 'privacy',
                child: ListTile(
                  leading: Icon(Icons.privacy_tip_outlined),
                  title: Text('Privacy Policy'),
                  contentPadding: EdgeInsets.zero,
                  visualDensity: VisualDensity.compact,
                ),
              ),
              const PopupMenuItem<String>(
                value: 'terms',
                child: ListTile(
                  leading: Icon(Icons.description_outlined),
                  title: Text('Terms & Conditions'),
                  contentPadding: EdgeInsets.zero,
                  visualDensity: VisualDensity.compact,
                ),
              ),
              const PopupMenuItem<String>(
                value: 'about',
                child: ListTile(
                  leading: Icon(Icons.info_outlined),
                  title: Text('About Us'),
                  contentPadding: EdgeInsets.zero,
                  visualDensity: VisualDensity.compact,
                ),
              ),
              const PopupMenuItem<String>(
                value: 'contact',
                child: ListTile(
                  leading: Icon(Icons.contact_mail_outlined),
                  title: Text('Contact Us'),
                  contentPadding: EdgeInsets.zero,
                  visualDensity: VisualDensity.compact,
                ),
              ),
            ],
          ),
        ],
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

