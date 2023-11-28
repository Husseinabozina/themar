import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:themar_app/Features/cart/presentation/views/components/finish_ordering/add_button.dart';
import 'package:themar_app/Features/cart/presentation/views/components/finish_ordering/cart_receit.dart';
import 'package:themar_app/Features/cart/presentation/views/components/finish_ordering/instraction_textfield.dart';
import 'package:themar_app/Features/cart/presentation/views/components/finish_ordering/paycard_item.dart';
import 'package:themar_app/Features/cart/presentation/views/components/finish_ordering/read_only_field.dart';
import 'package:themar_app/Features/cart/presentation/views/components/finish_ordering/selected_pay_card.dart';
import 'package:themar_app/Features/orders/presentation/views/components/order_button.dart';
import 'package:themar_app/core/config/app_assets.dart';
import 'package:themar_app/core/config/app_theme.dart';
import 'package:themar_app/core/widgets/custom_appbar.dart';
import 'package:themar_app/core/widgets/custom_button.dart';

class FinsihOrderPage extends StatefulWidget {
  const FinsihOrderPage({super.key});

  @override
  State<FinsihOrderPage> createState() => _FinsihOrderPageState();
}

final ValueNotifier<bool> isBottomCheatVisible = ValueNotifier<bool>(true);

class _FinsihOrderPageState extends State<FinsihOrderPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: ValueListenableBuilder<bool>(
        valueListenable: isBottomCheatVisible,
        builder: (context, isVisible, child) {
          if (isVisible) {
            return Padding(
              padding: EdgeInsets.symmetric(horizontal: 15),
              child: CustomButton(
                  onPressed: () {},
                  title: Text(
                    'إنهاء الطلب',
                    style: AppTheme.Font15Text3BoldStyle(),
                  )),
            );
          } else {
            return SizedBox(); //; Return an empty container when not visible
          }
        },
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.only(left: 15, right: 15, top: 40),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              CustomNamedAppBar(name: 'إتمام الطلب'),
              SizedBox(
                height: 31.h,
              ),
              _headlineText('الإسم : محمد'),
              SizedBox(
                height: 11.h,
              ),
              _headlineText('الجوال : 05068285914'),
              SizedBox(
                height: 36.h,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const AddButton(),
                  _headlineText("اختر عنوان التوصيل")
                ],
              ),
              SizedBox(
                height: 18.h,
              ),
              Container(
                height: 33,
                padding: EdgeInsets.only(left: 10, right: 10),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(25).r,
                    border: Border.all(color: AppTheme.colorPrimary)),
                width: double.infinity,
                child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      IconButton(
                          onPressed: () {},
                          icon: Container(
                            child: SvgPicture.asset(AppImages.arrowDown),
                          )),
                      Text(
                        'المنزل : 119 طريق الملك عبدالعزيز',
                        textAlign: TextAlign.center,
                        style: AppTheme.Font15PrimaryMediumStyle(),
                      )
                    ]),
              ),
              SizedBox(
                height: 32.h,
              ),
              _headlineText('تحديد وقت التوصيل'),
              SizedBox(
                height: 13.h,
              ),
              const Row(
                children: [
                  Expanded(
                    child: ReadOnlyTextField(
                      title: 'اختر الوقت',
                      icon: AppImages.clock,
                    ),
                  ),
                  SizedBox(
                    width: 20,
                  ),
                  Expanded(
                    child: ReadOnlyTextField(
                      title: "اختر التاريخ",
                      icon: AppImages.calender,
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 22.h,
              ),
              _headlineText('ملاحظات وتعليمات'),
              InstructionTextField(),
              SizedBox(
                height: 25.h,
              ),
              _headlineText('اختر طريقة الدفع'),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  SelectedPayCarItem(
                    widget: Image.asset(
                      AppImages.mastercard,
                      fit: BoxFit.fill,
                    ),
                  ),
                  SelectedPayCarItem(
                      widget: Image.asset(
                    AppImages.visa2,
                    fit: BoxFit.fill,
                  )),
                  Builder(
                    builder: (ctx) => GestureDetector(
                      onTap: () {
                        setState(() {
                          isBottomCheatVisible.value = false;
                        });
                        _showBottomSheet(ctx);
                      },
                      child: SelectedPayCarItem(
                          widget: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            'كاش',
                            style: AppTheme.Font18PrimaryBoldStyle(),
                          ),
                          Image.asset(
                            AppImages.cash,
                            fit: BoxFit.fill,
                            height: 24.h,
                            width: 30.w,
                          )
                        ],
                      )),
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 16.h,
              ),
              _headlineText('ملخص طريقة الدفع'),
              SizedBox(
                height: 30.h,
              ),
              const CartReceiptCard(),
              SizedBox(
                height: 100,
              )
            ],
          ),
        ),
      ),
    );
  }

  Widget _headlineText(String title) {
    return Text(
      title,
      style: AppTheme.Font17PrimaryBoldStyle(),
    );
  }

  _finisingOrderButtomSheet() {
    showModalBottomSheet(
        context: context,
        builder: (ctx) {
          return Container(
            height: 436.h,
            decoration: BoxDecoration(
                color: Colors.white, borderRadius: BorderRadius.circular(30)),
            child: Column(children: [
              Container(
                width: 247.56.w,
                height: 222.67.h,
                child: Image.asset(AppImages.orderGroup),
              ),
              SizedBox(
                height: 23.h,
              ),
              Text(
                '',
                style: AppTheme.Font20PrimaryBoldStyle(),
              ),
              SizedBox(
                height: 16.h,
              ),
              Text(
                'data',
                style: AppTheme.Font17PrimaryBoldStyle(),
              )
            ]),
          );
        });
  }

  _showBottomSheet(BuildContext context) {
    showModalBottomSheet(
        context: context,
        builder: (ctx) {
          return Container(
            height: 317.h,
            width: 376.w,
            decoration: const BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                    topRight: Radius.circular(30),
                    topLeft: Radius.circular(30))),
            child: Padding(
              padding: const EdgeInsets.only(top: 15, right: 15, bottom: 5).r,
              child: Column(children: [
                Text(
                  'البطاقات المحفوظة',
                  style: AppTheme.Font15PrimaryBoldStyle(),
                ),
                SizedBox(
                  height: 25.h,
                ),
                PayCardListView(),
                SizedBox(
                  height: 25.h,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Text(
                      'إضافة بطاقة دفع',
                      style: AppTheme.Font17PrimaryMeduimStyle(),
                    ),
                    SizedBox(
                      width: 5.w,
                    ),
                    Container(
                      height: 20.h,
                      width: 20.w,
                      decoration: BoxDecoration(
                          color: AppTheme.colorPrimarylight,
                          borderRadius: BorderRadius.circular(5)),
                      child: Center(child: SvgPicture.asset(AppImages.add)),
                    ),
                  ],
                ),
                SizedBox(
                  height: 15.h,
                ),
                Padding(
                  padding: EdgeInsets.only(
                    left: 10,
                  ),
                  child: CustomButton(
                      title: Text(
                        'تأكيد الإختبار',
                        style: AppTheme.Font15Text3BoldStyle(),
                      ),
                      onPressed: () {
                        Navigator.pop(context);
                      }),
                )
              ]),
            ),
          );
        }).then((value) {
      setState(() {
        isBottomCheatVisible.value = true;
      });
    });
  }
}
