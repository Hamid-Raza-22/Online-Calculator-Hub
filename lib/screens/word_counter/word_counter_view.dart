import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:online_calculator_hub/screens/word_counter/word_counter_controller.dart';
import 'package:online_calculator_hub/utils/Constants/colors.dart';
import 'package:online_calculator_hub/widgets/custom_button.dart';
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
                      spacing: 5,
                      children: [
                        Text("Text Statistics:", style: TextStyle(fontWeight: FontWeight.w600)),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [

                            Obx(() => Customcountscontainer(count: controller.wordCount.value.toString(), text: 'Words', countColor: Colors.red)),
                            Obx(() => Customcountscontainer(count: controller.charCount.value.toString(), text: 'Characters', countColor: Colors.green)),
                            Obx(() => Customcountscontainer(count: controller.charCountNoSpaces.value.toString(), text: 'Characters (No Spaces)', countColor: Colors.black)),
                          ],
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          spacing: 2,
                          children: [
                            Obx(() => Customcountscontainer(count: controller.sentenceCount.value.toString(), text: 'Sentences', countColor: Colors.deepPurple)),
                            Obx(() => Customcountscontainer(count: controller.paragraphCount.value.toString(), text: 'Paragraphs', countColor: Colors.pink)),
                            Obx(() => Customcountscontainer(count: controller.avgWordLength.value.round().toString(), text: ' Avg Word Length', countColor: Colors.brown)),
                            Obx(() => Customcountscontainer( count: controller.readingTime.value,text: 'Time', countColor: Colors.black,)),
                          ],
                        ),


                      ],
                    ),
                  ),
                ),
                CustomTextButton(text: "Reset", onPressed: (){
                  if(controller.inputController.text.isNotEmpty){
                    return controller.reset();
                  }else{
                    Get.snackbar("Please enter some text!", "Input field is Empty");
                  }
                  
                  
                }, buttonColor: Colors.grey,
                textColor: Colors.white,)

              ],
            ),
          ),
        ),
      ),
    );
  }
}
