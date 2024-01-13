import 'package:flutter/material.dart';
import 'package:themar_app/Features/Profile/data/models/order.dart';
import 'package:themar_app/core/config/app_theme.dart';
import 'package:themar_app/core/utils/enums.dart';

Widget checkOrderStatus(OrderStatus orderStatus) {
  switch (orderStatus) {
    case OrderStatus.waiting:
      return const Text('بإنتظار الموافقة',
          style: TextStyle(
              fontSize: 11,
              color: AppTheme.colorPrimary,
              fontWeight: FontWeight.bold));
    case OrderStatus.gettingPrepared:
      return const Text('جاري التحضير',
          style: TextStyle(
              fontSize: 11,
              color: AppTheme.colorPrimary,
              fontWeight: FontWeight.bold));
    case OrderStatus.prepared:
      return const Text('تم التحضر',
          style: TextStyle(
              fontSize: 11,
              color: AppTheme.colorPrimary,
              fontWeight: FontWeight.bold));
    default:
      return const Text('منتهي',
          style: TextStyle(
              fontSize: 11,
              color: AppTheme.colorPrimary,
              fontWeight: FontWeight.bold));
  }
}

List getPreparedOrderList = [
  Order(orderStatus: OrderStatus.gettingPrepared),
  Order(orderStatus: OrderStatus.gettingPrepared),
  Order(orderStatus: OrderStatus.gettingPrepared),
  Order(orderStatus: OrderStatus.gettingPrepared),
  Order(orderStatus: OrderStatus.gettingPrepared),
];
List doneOrderList = [
  Order(orderStatus: OrderStatus.done),
  Order(orderStatus: OrderStatus.done),
  Order(orderStatus: OrderStatus.done),
  Order(orderStatus: OrderStatus.done),
  Order(orderStatus: OrderStatus.done),
];
