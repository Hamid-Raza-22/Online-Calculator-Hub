import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:online_calculator_hub/screens/word_counter/word_counter_controller.dart';
import 'package:online_calculator_hub/utils/Constants/colors.dart';
import 'package:online_calculator_hub/widgets/custom_multi_line_input.dart';
import 'package:online_calculator_hub/widgets/custom_app_bar.dart';
import 'package:online_calculator_hub/widgets/custom_counts_container.dart';

class WordCounterView extends StatelessWidget {
  final controller = Get.put(TextStatsController());
  final String title;
  final _formKey = GlobalKey<FormState>();
WordCounterView({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(bgColor: AppColors.PrimaryColor, iconColor: Colors.white, title: title),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Form(
            key: _formKey,
            child: Column(
              spacing: 10,
              children: [

                CustomMultiLineField(label: "Enter or paste your text", hint:'Type or Paste you text here.......',controller: controller.inputController,),
                Container(
                  decoration: BoxDecoration(
                    color: Colors.cyan.withValues(alpha: 0.5),
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.only(top: 8.0, left: 8.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text("Text Statistics:", style: TextStyle(fontWeight: FontWeight.w600)),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [

                            Obx(() => Customcountscontainer(count: controller.wordCount.value.toString(), text: 'Words', count_color: Colors.red)),
                            Obx(() => Customcountscontainer(count: controller.charCount.value.toString(), text: 'Characters', count_color: Colors.green)),
                            Obx(() => Customcountscontainer(count: controller.charCountNoSpaces.value.toString(), text: 'Characters (No Spaces)', count_color: Colors.black)),
                          ],
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            Obx(() => Customcountscontainer(count: controller.sentenceCount.value.toString(), text: 'Sentences', count_color: Colors.deepPurple)),
                            Obx(() => Customcountscontainer(count: controller.paragraphCount.value.toString(), text: 'Paragraphs', count_color: Colors.pink)),
                            Obx(() => Customcountscontainer(count: controller.avgWordLength.value.round().toString(), text: 'Avg Word Length', count_color: Colors.brown)),
                            Obx(() => Customcountscontainer( count: controller.readingTime.value,text: 'Time', count_color: Colors.black,)),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),

              ],
            ),
          ),
        ),
      ),
    );
  }
}
