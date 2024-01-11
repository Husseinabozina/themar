import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:themar_app/Features/home/presentation/manager/ProductCubit/cubit/products_cubit.dart';
import 'package:themar_app/Features/home/presentation/views/widgets/products_grid_view.dart';
import 'package:themar_app/core/config/app_theme.dart';

class FavoritePage extends StatelessWidget {
  const FavoritePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 50),
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text(
              'المفضلة',
              style: AppTheme.Font20PrimaryBoldStyle(),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 30),
            ProductCardsGridView(
              itemCount: 3,
              aspectRacio: 1.5 / 2,
              products: context.read<ProductsCubit>().products,
            )
          ],
        ),
      ),
    );
  }
}
