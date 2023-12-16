import 'package:flutter/material.dart';
import 'package:themar_app/core/utils/enums.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'order_state.dart';

class OrderCubit extends Cubit<OrderState> {
  OrderCubit() : super(OrderInitial());
  static OrderCubit get(context) => BlocProvider.of<OrderCubit>(context);
  late AnimationController controller;
  var orderStatus = OrderStatus.gettingPrepared;
  deleteListener() {
    controller.clearListeners();
    emit(deleteListener());
  }

  changeOrderStatusView(int index) {
    if (index == 0) {
      orderStatus = OrderStatus.done;
    } else {
      orderStatus = OrderStatus.gettingPrepared;
    }
    emit(OrderStatusChanges());
  }
}
