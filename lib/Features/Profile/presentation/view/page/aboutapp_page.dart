import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';
import 'package:themar_app/Features/Profile/presentation/view/components/space.dart';
import 'package:themar_app/Features/Profile/presentation/view/utils.dart';
import 'package:themar_app/Features/aditional/manager/cubit/additional_cubit.dart';
import 'package:themar_app/core/config/app_assets.dart';
import 'package:themar_app/core/components/custom_appbar.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AboutAppPage extends StatefulWidget {
  const AboutAppPage({super.key});

  @override
  State<AboutAppPage> createState() => _AboutAppPageState();
}

class _AboutAppPageState extends State<AboutAppPage> {
  @override
  void initState() {
    super.initState();
    context.read<AdditionalCubit>().showAboutAppString();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 16),
              child: CustomNamedAppBar(name: 'عن التطبيق'),
            ),
            const Space(height: 22),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Center(
                  child: SvgPicture.asset(
                    AppImages.logo,
                    fit: BoxFit.fill,
                    height: 157.08.h,
                    width: 159.57.w,
                  ),
                ),
              ],
            ),
            const Space(height: 25),
            Container(
              padding: EdgeInsets.symmetric(horizontal: 13.w),
              width: double.infinity,
              child: BlocBuilder<AdditionalCubit, AdditionalState>(
                builder: (context, state) {
                  return state is! AdditionalAboutAppLoadingState ||
                          state is! AdditionalAboutAppFailureState
                      ? Text(
                          context.read<AdditionalCubit>().aboutAppString,
                          textDirection: TextDirection.rtl,
                        )
                      : const Text('');
                },
              ),
            )
          ],
        ),
      ),
    );
  }
}
