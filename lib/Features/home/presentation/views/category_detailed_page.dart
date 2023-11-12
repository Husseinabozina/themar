import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:themar_app/Features/home/presentation/views/widgets/category_detailed/category_detailed_page_appbar.dart';
import 'package:themar_app/Features/home/presentation/views/widgets/product_card.dart';
import 'package:themar_app/Features/home/presentation/views/widgets/product_category_card.dart';
import 'package:themar_app/Features/home/presentation/views/widgets/products_grid_view.dart';
import 'package:themar_app/Features/home/presentation/views/widgets/search_textField.dart';
import 'package:themar_app/core/config/app_assets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:themar_app/core/config/app_theme.dart';
import 'package:themar_app/core/widgets/custom_appbar.dart';

class CategoryDetailedPage extends StatelessWidget {
  const CategoryDetailedPage({required this.name, super.key});
  final String name;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.only(top: 40),
          child: Column(
            children: [
              Padding(
                padding: EdgeInsets.only(right: 20, left: 20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    CustomNamedAppBar(
                      name: name,
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    SearchTextField(
                      icon: _filtersButton(),
                    ),
                  ],
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              const ProductsGridView(
                itemCount: 8,
                aspectRacio: 1 / 1.25,
              )
            ],
          ),
        ),
      ),
    );
  }

  Widget _filtersButton() {
    return Container(
      margin: const EdgeInsets.only(left: 10),
      height: 40.h,
      width: 40.h,
      decoration: BoxDecoration(
          color: AppTheme.colorPrimary,
          borderRadius: BorderRadius.circular(10)),
      padding: const EdgeInsets.all(7),
      child: SvgPicture.asset(AppImages.filters),
    );
  }
}
