import 'package:flutter/material.dart';
import 'package:themar_app/const.dart';
import 'package:themar_app/core/components/custom_appbar.dart';

class PolicyPage extends StatelessWidget {
  const PolicyPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          children: [
            CustomNamedAppBar(name: 'سياسة الخصوصية'),
            SizedBox(
              child: Text(privacyText),
            )
          ],
        ),
      ),
    );
  }
}
