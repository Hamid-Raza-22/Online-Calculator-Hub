import 'package:flutter/material.dart';
import 'package:online_calculator_hub/utils/Constants/colors.dart';
import 'package:online_calculator_hub/widgets/custom_multi_line_input.dart';
import 'package:online_calculator_hub/widgets/custom_app_bar.dart';
import 'package:online_calculator_hub/widgets/custom_counts_container.dart';

class WordCounterView extends StatelessWidget {
  final String title;
  const WordCounterView({super.key, required this.title});

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

              CustomMultiLineField(label: "Enter or paste your text", hint:'Type or Paste you text here.......'),
              Container(

                decoration: BoxDecoration(
                  color: Colors.cyan.withValues(alpha: 0.5),
                  borderRadius: BorderRadius.circular(12)
                ),
                child: Padding(
                  padding: const EdgeInsets.only(top: 8.0,left: 8.0),
                  child: Column(
                    spacing: 20,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text("Text Statistics:",style: TextStyle(fontWeight: FontWeight.w600),),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                        Customcountscontainer(count: 0, text: 'words', count_color: Colors.red),
                        Customcountscontainer(count: 0, text: 'Characters', count_color: Colors.green),
                        Customcountscontainer(count: 0, text: 'Characters', count_color: Colors.black),

                      ],),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                        Customcountscontainer(count: 0, text: 'Sentences', count_color: Colors.deepPurple),
                        Customcountscontainer(count: 0, text: 'Paragraphs', count_color: Colors.pink),
                        Padding(
                          padding: const EdgeInsets.only(left: 3.0),
                          child: Customcountscontainer(count: 0, text: 'Avg Word Length', count_color: Colors.brown),
                        ),
                        Customcountscontainer(count: 0, text: 'Reading Time', count_color: Colors.black),
                      ],)
                    ],
                  ),
                ),
              )

            ],
          ),
        ),
      ),
    );
  }
}
