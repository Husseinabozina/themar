import 'package:flutter/material.dart';
import 'package:themar_app/Features/Profile/presentation/view/components/space.dart';
import 'package:themar_app/Features/home/presentation/views/widgets/category_detailed/filters_icon.dart';
import 'package:themar_app/Features/home/presentation/views/widgets/products_grid_view.dart';
import 'package:themar_app/Features/home/presentation/views/widgets/search_textField.dart';
import 'package:themar_app/core/components/custom_appbar.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CategoryDetailedPage extends StatelessWidget {
  const CategoryDetailedPage({required this.name, super.key});
  final String name;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: EdgeInsets.only(right: 20.w, left: 20.w),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  CustomNamedAppBar(
                    name: name,
                  ),
                  const Space(height: 20),
                  const SearchTextField(
                    icon: FiltersIcon(),
                  ),
                ],
              ),
            ),
            const Space(height: 20),
            const ProductCardsGridView(
              itemCount: 8,
              aspectRacio: 1 / 1.25,
            )
          ],
        ),
      ),
    );
  }
}
