import 'package:flutter/material.dart';
import 'package:themar_app/Features/Profile/presentation/view/components/space.dart';
import 'package:themar_app/core/widgets/custom_appbar.dart';

class AddressPickerPage extends StatelessWidget {
  const AddressPickerPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Column(
        children: [
          CustomNamedAppBar(name: 'إضافة عنوان'),
          SizedBox(height: 25),
          Stack(
            children: [SizedBox()],
          )
        ],
      ),
    );
  }
}
