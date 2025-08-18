import 'package:flutter/material.dart';
import 'package:online_calculator_hub/widgets/custom_grid_view.dart';

import '../../widgets/customTextFeild.dart';

class HomescreenView extends StatelessWidget {
  const HomescreenView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("All tools App"),
        backgroundColor: Colors.pink,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.only(top: 16.0,left: 20.0,right: 16),
          child: Column(
            spacing: 10,
            children: [
        
              Text("All-in-One Online Calculators",style: TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.bold,
        
              ),),
              CustomTextField(hintText: "Search Calculators...", icon:Icons.search,),
              CustomGridView()
        
            ],
          ),
        ),
      ),
    );
  }
}
