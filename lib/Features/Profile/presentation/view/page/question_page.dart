import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:themar_app/Features/Profile/presentation/view/components/space.dart';
import 'package:themar_app/core/config/app_assets.dart';
import 'package:themar_app/core/config/app_theme.dart';
import 'package:themar_app/core/widgets/custom_appbar.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'dart:math';

class CommonQuestionPage extends StatelessWidget {
  const CommonQuestionPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
                padding: EdgeInsets.only(right: 16.w, top: 20),
                child: const CustomNamedAppBar(name: 'أسئلة متكررة')),
            Space(height: 40.h),
            Padding(
                padding: EdgeInsets.symmetric(horizontal: 20),
                child: ListView.separated(
                  physics: const NeverScrollableScrollPhysics(),
                  separatorBuilder: (context, index) => SizedBox(
                    height: 17,
                  ),
                  shrinkWrap: true,
                  itemBuilder: (context, index) => QuestionItem(),
                  itemCount: 10,
                ))
          ],
        ),
      ),
    );
  }
}

class QuestionItem extends StatefulWidget {
  const QuestionItem({super.key});

  @override
  State<QuestionItem> createState() => _QuestionItemState();
}

class _QuestionItemState extends State<QuestionItem> {
  bool _expanded = false;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(5),
      width: double.infinity,
      decoration: BoxDecoration(
          color: Colors.white,
          boxShadow: [
            BoxShadow(
              color: Color(0x05000000),
              blurRadius: 8.50,
              offset: Offset(0, 6),
              spreadRadius: 0,
            )
          ],
          borderRadius: BorderRadius.circular(10)),
      child: Center(
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                SizedBox(
                  height: 40,
                  width: 40,
                  child: IconButton(
                      iconSize: 10,
                      onPressed: () {
                        setState(() {
                          _expanded = !_expanded;
                        });
                      },
                      icon: !_expanded
                          ? Container(
                              height: 20,
                              width: 20,
                              decoration: BoxDecoration(
                                  color: AppTheme.colorPrimarylight,
                                  borderRadius: BorderRadius.circular(5)),
                              child: Center(
                                  child: Icon(Icons.keyboard_arrow_down_sharp)),
                            )
                          : Container(
                              height: 20,
                              width: 20,
                              decoration: BoxDecoration(
                                  color: AppTheme.colorPrimarylight,
                                  borderRadius: BorderRadius.circular(5)),
                              child: Center(child: Icon(Icons.remove)),
                            )),
                ),
                Text(
                  'كيفية الدفع عن طريق البطاقة الإئتمانيه؟',
                  style: AppTheme.Font15PrimaryBoldStyle(),
                )
              ],
            ),
            if (_expanded)
              Divider(
                color: Color(0xFFF1F1F1),
              ),
            if (_expanded)
              Text(
                  'fljsdl;fjsadjlfljldsfjlsjdfljsldfjljsdfljslfjldjfldjfljslfdjsldfjlsdfljsjsldjflsdjflsjfljdslj'),
          ],
        ),
      ),
    );
  }
}
