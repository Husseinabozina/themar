import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:themar_app/Features/Profile/presentation/view/components/personal_info_section.dart';
import 'package:themar_app/Features/auth/views/components/auth_form_field.dart';
import 'package:themar_app/Features/auth/views/components/group_widget.dart';
import 'package:themar_app/Features/auth/views/components/phone_number_field.dart';
import 'package:themar_app/Features/auth/views/components/registeration/carInfo_form.dart';
import 'package:themar_app/Features/auth/views/components/registeration/personalInfo_fom.dart';
import 'package:themar_app/Features/auth/views/manager/cubit/registeration/register_cubit.dart';
import 'package:themar_app/const.dart';
import 'package:themar_app/core/config/app_assets.dart';
import 'package:themar_app/core/config/app_theme.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:dotted_line/dotted_line.dart';
import 'package:themar_app/core/components/custom_button.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class DeliverRegisterScreen extends StatelessWidget {
  const DeliverRegisterScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          groupSvg(),
          SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.only(left: 15, right: 15, top: 40).w,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  SvgPicture.asset(
                    AppImages.logo,
                    height: 0.1584.sh,
                    width: 0.3461.sw,
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  BlocConsumer<RegisterCubit, RegisterState>(
                    listener: (context, state) {},
                    builder: (context, state) {
                      return Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          Text(
                            'مرحبا بك مرة أخري ',
                            textAlign: TextAlign.end,
                            style: AppTheme.Font16PrimaryBoldStyle(),
                          ),
                          SizedBox(
                            height: 8.h,
                          ),
                          Text(
                            'يمكنك تسجيل الدخول اللان',
                            key: const ValueKey("login"),
                            style: AppTheme.Font16Text2LightStyle(),
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          Align(
                            alignment: Alignment.center,
                            child: SizedBox(
                              width: 250,
                              height: 100,
                              child: Stack(
                                fit: StackFit.expand,
                                children: [
                                  Positioned(
                                    top: 12.5,
                                    left: 50,
                                    right: 50,
                                    child: DottedLine(
                                      dashColor: state is PeronalInfoComplete
                                          ? AppTheme.colorPrimary
                                          : AppTheme.colorText2,
                                    ),
                                  ),
                                  const Positioned(
                                      right: 0,
                                      child: CustomCard(
                                        isactive: true,
                                        num: 1,
                                        title: 'بيانات الشخصية',
                                      )),
                                  Positioned(
                                      left: 0,
                                      child: CustomCard(
                                        isactive: state is PeronalInfoComplete
                                            ? true
                                            : false,
                                        num: 2,
                                        title: ' بيانات السيارة',
                                      )),
                                ],
                              ),
                            ),
                          ),
                          state is PeronalInfoComplete
                              ? const CarInfoForm()
                              : const PersonalInfoForm()
                        ],
                      );
                    },
                  ),
                  InkWell(
                    onTap: () {},
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          loginText,
                          style: AppTheme.Font18PrimaryBoldStyle(),
                        ),
                        Text(
                          haveAccountText,
                          style: AppTheme.Font15PrimaryBoldStyle(),
                        )
                      ],
                    ),
                  )
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class CustomCard extends StatelessWidget {
  const CustomCard({super.key, this.title, this.num, required this.isactive});
  final String? title;
  final int? num;
  final bool isactive;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          height: 33,
          width: 33,
          decoration: BoxDecoration(
              color: isactive
                  ? AppTheme.colorPrimary
                  : AppTheme.colorText2.withOpacity(0.5),
              borderRadius: BorderRadius.circular(8).r),
          child: Center(
              child: Text(
            num.toString() ?? '1',
            style: TextStyle(
                color: isactive ? AppTheme.colorText3 : AppTheme.colorText2,
                height: 2.5,
                fontSize: AppTheme.font13.sp,
                fontWeight: FontWeight.bold),
          )),
        ),
        SizedBox(
          height: 3,
        ),
        Text(
          title ?? 'البيانات الشخصية',
          textAlign: TextAlign.center,
          style: TextStyle(
              color: isactive ? AppTheme.colorPrimary : AppTheme.colorText2,
              fontSize: AppTheme.font13.sp,
              fontWeight: FontWeight.bold),
        )
      ],
    );
  }
}
