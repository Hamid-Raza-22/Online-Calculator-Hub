import 'package:flutter/material.dart';
import 'package:online_calculator_hub/utils/Constants/colors.dart';
import 'package:online_calculator_hub/widgets/CustomMultiLineInput.dart';
import 'package:online_calculator_hub/widgets/customAppBar.dart';
import 'package:online_calculator_hub/widgets/customCountsContainer.dart';

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
                  color: Colors.cyan,
                  borderRadius: BorderRadius.circular(12)
                ),
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    spacing: 20,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text("Text Statistics:"),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                        Customcountscontainer(count: 0, text: 'words', count_color: Colors.red),
                        Customcountscontainer(count: 0, text: 'Characters', count_color: Colors.green),
                        Customcountscontainer(count: 0, text: 'Characters', count_color: Colors.black),

                      ],),
                      Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                        Customcountscontainer(count: 0, text: 'Sentences', count_color: Colors.deepPurple),
                        Customcountscontainer(count: 0, text: 'Paragraphs', count_color: Colors.pink),
                        Customcountscontainer(count: 0, text: 'Avg Word Length', count_color: Colors.brown),
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
