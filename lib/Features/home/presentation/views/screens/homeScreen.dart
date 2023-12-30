import 'package:flutter/material.dart';
import 'package:themar_app/Features/home/presentation/manager/HomeCubit/home_cubit.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:themar_app/Features/home/presentation/views/widgets/home/custom_nav_bar.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<HomeCubit, HomeState>(
      listener: (context, state) {
        // TODO: implement listener
      },
      builder: (context, state) {
        final homecubit = BlocProvider.of<HomeCubit>(context);
        return Scaffold(
          backgroundColor: const Color(0xFFFDFDFD),
          body: homecubit.getCurrentPage(),
          bottomNavigationBar: CustomNavigationBar(
            items: homecubit.clientNavItems,
            currentIndex: homecubit.currentIndex,
            onTab: (index) => homecubit.onNavBarTap(index),
          ),
        );
      },
    );
  }
}
