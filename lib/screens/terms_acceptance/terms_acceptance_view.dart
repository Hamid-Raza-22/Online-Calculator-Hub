import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:online_calculator_hub/utils/Constants/colors.dart';
import 'package:online_calculator_hub/widgets/custom_text.dart';
import 'package:online_calculator_hub/widgets/custom_button.dart';
import 'package:online_calculator_hub/screens/home_screen/home_screen_view.dart';
import 'package:online_calculator_hub/screens/webview/webview_screen.dart';

class TermsAcceptanceView extends StatelessWidget {
  const TermsAcceptanceView({super.key});

  static const String _privacyPolicyUrl =
      'https://onlinecalculatorshub.com/privacy-policy.html';
  static const String _termsUrl =
      'https://onlinecalculatorshub.com/terms.html';

  Future<void> _onContinue() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setBool('terms_accepted', true);
    Get.offAll(() => const HomeScreenView());
  }

  void _openPrivacyPolicy() {
    Get.to(() => const WebViewScreen(
          title: 'Privacy Policy',
          url: _privacyPolicyUrl,
        ));
  }

  void _openTermsAndConditions() {
    Get.to(() => const WebViewScreen(
          title: 'Terms & Conditions',
          url: _termsUrl,
        ));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 32.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Spacer(),
              Icon(
                Icons.calculate_rounded,
                size: 80,
                color: AppColors.PrimaryColor,
              ),
              const SizedBox(height: 24),
              TextWidget(
                text: 'Welcome to\nOnline Calculator Hub',
                fontSize: 26,
                weight: FontWeight.bold,
                textcolor: AppColors.PrimaryColor,
                align: TextAlign.center,
              ),
              const SizedBox(height: 16),
              TextWidget(
                text:
                    'Free, fast, and accurate calculator tools for all your daily needs',
                fontSize: 16,
                weight: FontWeight.w400,
                textcolor: Colors.grey[600]!,
                align: TextAlign.center,
              ),
              const Spacer(),
              Container(
                padding: const EdgeInsets.all(20),
                decoration: BoxDecoration(
                  color: Colors.grey[50],
                  borderRadius: BorderRadius.circular(16),
                  border: Border.all(color: Colors.grey[200]!),
                ),
                child: Column(
                  children: [
                    Icon(
                      Icons.shield_outlined,
                      size: 40,
                      color: AppColors.PrimaryColor,
                    ),
                    const SizedBox(height: 12),
                    TextWidget(
                      text: 'Your Privacy Matters',
                      fontSize: 18,
                      weight: FontWeight.w600,
                      textcolor: AppColors.PrimaryColor,
                    ),
                    const SizedBox(height: 12),
                    RichText(
                      textAlign: TextAlign.center,
                      text: TextSpan(
                        style: TextStyle(
                          fontSize: 14,
                          color: Colors.grey[700],
                          height: 1.5,
                        ),
                        children: [
                          const TextSpan(
                            text:
                                'By continuing, you agree to our ',
                          ),
                          TextSpan(
                            text: 'Privacy Policy',
                            style: TextStyle(
                              color: AppColors.PrimaryColor,
                              fontWeight: FontWeight.w600,
                              decoration: TextDecoration.underline,
                            ),
                            recognizer: TapGestureRecognizer()
                              ..onTap = _openPrivacyPolicy,
                          ),
                          const TextSpan(text: ' and '),
                          TextSpan(
                            text: 'Terms & Conditions',
                            style: TextStyle(
                              color: AppColors.PrimaryColor,
                              fontWeight: FontWeight.w600,
                              decoration: TextDecoration.underline,
                            ),
                            recognizer: TapGestureRecognizer()
                              ..onTap = _openTermsAndConditions,
                          ),
                          const TextSpan(
                            text:
                                '. We respect your privacy and are committed to protecting your personal data.',
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              const Spacer(),
              CustomTextButton(
                text: 'Continue',
                onPressed: _onContinue,
                buttonColor: AppColors.PrimaryColor,
                textColor: Colors.white,
                size: double.infinity,
                fontSize: 18,
                fontWeight: FontWeight.w600,
              ),
              const SizedBox(height: 16),
            ],
          ),
        ),
      ),
    );
  }
}
