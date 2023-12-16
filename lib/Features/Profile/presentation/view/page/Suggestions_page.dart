import 'package:flutter/material.dart';
import 'package:themar_app/Features/Profile/presentation/view/components/space.dart';
import 'package:themar_app/core/config/app_theme.dart';
import 'package:themar_app/core/components/custom_appbar.dart';
import 'package:themar_app/core/components/custom_button.dart';
import 'package:themar_app/core/components/custom_textField.dart';

class SuggestionPage extends StatelessWidget {
  const SuggestionPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          children: [
            const CustomNamedAppBar(name: 'الاقتراحات والشكاوي'),
            const Space(height: 47),
            const SizedBox(
                height: 55, child: customTextField(hintText: 'الاسم')),
            const Space(height: 10),
            const SizedBox(
                height: 55, child: customTextField(hintText: 'الاسم')),
            const customTextField(
              hintText: 'الموضوع',
              maxlines: 3,
            ),
            CustomButton(
                title: Text(
                  'إرسال',
                  style: AppTheme.Font15Text3BoldStyle(),
                ),
                onPressed: () {})
          ],
        ),
      ),
    );
  }
}
