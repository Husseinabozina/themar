import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';

part 'order_state.dart';

class OrderCubit extends Cubit<OrderState> {
  OrderCubit() : super(OrderInitial());
  late AnimationController controller;
  deleteListener() {
    controller.clearListeners();
    emit(deleteListener());
  }
}
