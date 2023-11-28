import 'package:flutter/material.dart';
import 'package:themar_app/Features/Profile/presentation/view/components/addressPage/address_card.dart';
import 'package:themar_app/Features/Profile/presentation/view/components/space.dart';
import 'package:themar_app/Features/wallet/presentation/view/components/wallet_balance_section.dart';
import 'package:themar_app/core/config/App_routes.dart';
import 'package:themar_app/core/config/app_assets.dart';
import 'package:themar_app/core/config/app_theme.dart';
import 'package:themar_app/core/widgets/custom_appbar.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:themar_app/core/widgets/custom_icon_button.dart';
import 'package:go_router/go_router.dart';

class AdressPage extends StatelessWidget {
  const AdressPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            children: [
              const CustomNamedAppBar(name: 'name'),
              const Space(height: 33),
              ListView.separated(
                physics: const NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                itemBuilder: (context, index) => const AddressCard(),
                separatorBuilder: (context, index) => const Space(height: 20),
                itemCount: 5,
              ),
              const Space(
                height: 20,
              ),
              DottedBorderButton(
                  onTap: () {
                    GoRouter.of(context).push(AppRoutes.addressPickerPage);
                  },
                  title: 'اضافة عنوان'),
              const SizedBox(
                height: 20,
              )
            ],
          ),
        ),
      ),
    );
  }
}
