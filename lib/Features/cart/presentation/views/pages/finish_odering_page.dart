import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:themar_app/Features/Profile/presentation/view/components/space.dart';
import 'package:themar_app/Features/cart/presentation/views/components/finish_ordering/address_picker.dart';
import 'package:themar_app/Features/cart/presentation/views/components/finish_ordering/bottom_sheet_container.dart';
import 'package:themar_app/Features/cart/presentation/views/components/finish_ordering/cart_receit.dart';
import 'package:themar_app/Features/cart/presentation/views/components/finish_ordering/delivery_time_picker_section.dart';
import 'package:themar_app/Features/cart/presentation/views/components/finish_ordering/finishOrder_bottomSheet_Container.dart';
import 'package:themar_app/Features/cart/presentation/views/components/finish_ordering/identity_section.dart';
import 'package:themar_app/Features/cart/presentation/views/components/finish_ordering/instruction_section.dart';
import 'package:themar_app/Features/cart/presentation/views/components/finish_ordering/selected_pay_card.dart';
import 'package:themar_app/core/config/app_assets.dart';
import 'package:themar_app/core/config/app_theme.dart';
import 'package:themar_app/core/components/custom_appbar.dart';
import 'package:themar_app/core/components/custom_button.dart';

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
              padding: const EdgeInsets.symmetric(horizontal: 15),
              child: CustomButton(
                  onPressed: () {
                    _showFinisingOrderButtomSheet();
                  },
                  title: Text(
                    'إنهاء الطلب',
                    style: AppTheme.Font15Text3BoldStyle(),
                  )),
            );
          } else {
            return const SizedBox(); //; Return an empty container when not visible
          }
        },
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.only(left: 15, right: 15),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              const CustomNamedAppBar(name: 'إتمام الطلب'),
              const Space(
                height: 31,
              ),
              const IdentitySection(),
              const Space(
                height: 36,
              ),
              const AdressPickerSection(),
              SizedBox(
                height: 32.h,
              ),
              const DeliverTimePickerSection(),
              const StructionSection(),
              SizedBox(
                height: 25.h,
              ),
              Text(
                'اختر طريقة الدفع',
                style: AppTheme.Font17PrimaryBoldStyle(),
              ),
              Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
                Builder(
                  builder: (ctx) => GestureDetector(
                    onTap: () {
                      setState(() {
                        isBottomCheatVisible.value = false;
                      });
                      _showBottomSheet(ctx);
                    },
                    child: SelectedPayCarItem(
                      widget: Image.asset(
                        AppImages.mastercard,
                        fit: BoxFit.fill,
                      ),
                    ),
                  ),
                ),
                Builder(
                  builder: (ctx) => GestureDetector(
                    onTap: () {
                      setState(() {
                        isBottomCheatVisible.value = false;
                      });
                      _showBottomSheet(ctx);
                    },
                    child: SelectedPayCarItem(
                        widget: Image.asset(
                      AppImages.visa2,
                      fit: BoxFit.fill,
                    )),
                  ),
                ),
                SelectedPayCarItem(
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
                ))
              ]),
              SizedBox(
                height: 16.h,
              ),
              Text(
                'ملخص طريقة الدفع',
                style: AppTheme.Font17PrimaryBoldStyle(),
              ),
              SizedBox(
                height: 30.h,
              ),
              const CartReceiptCard(),
              const SizedBox(
                height: 100,
              )
            ],
          ),
        ),
      ),
    );
  }

  _showFinisingOrderButtomSheet() {
    showModalBottomSheet(
        context: context,
        builder: (ctx) {
          return const FinishOrderButtomSheetContainer();
        });
  }

  _showBottomSheet(BuildContext context) {
    showModalBottomSheet(
        context: context,
        builder: (ctx) {
          return const BottomSheetContainer();
        }).then((value) {
      setState(() {
        isBottomCheatVisible.value = true;
      });
    });
  }
}
