import 'package:flutter/material.dart';
import 'package:themar_app/Features/home/presentation/manager/cubit/home_cubit.dart';
import 'package:themar_app/Features/home/presentation/views/pages/home_page.dart';
import 'package:themar_app/Features/orders/presentation/views/pages/orders_page.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:themar_app/Features/home/presentation/views/widgets/home/custom_nav_bar.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<HomeCubit, HomeState>(
      listener: (context, state) {
        // TODO: implement listener
      },
      builder: (context, state) {
        final homecubit = BlocProvider.of<HomeCubit>(context);
        return Scaffold(
          backgroundColor: Color(0xFFFDFDFD),
          body: homecubit.getCurrentPage(),
          bottomNavigationBar: CustomNavigationBar(
            items: homecubit.homeNavItems,
            currentIndex: homecubit.currentIndex,
            onTab: (index) => homecubit.onNavBarTap(index),
          ),
        );
      },
    );
  }
}
