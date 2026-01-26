import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:online_calculator_hub/screens/home_screen/home_screen_view.dart';
import 'package:online_calculator_hub/screens/terms_acceptance/terms_acceptance_view.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final prefs = await SharedPreferences.getInstance();
  final termsAccepted = prefs.getBool('terms_accepted') ?? false;
  runApp(MyApp(showTermsScreen: !termsAccepted));
}

class MyApp extends StatelessWidget {
  final bool showTermsScreen;

  const MyApp({super.key, required this.showTermsScreen});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      home: showTermsScreen
          ? const TermsAcceptanceView()
          : const HomeScreenView(),
    );
  }
}

