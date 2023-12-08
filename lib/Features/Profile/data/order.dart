import 'package:themar_app/core/utils/enums.dart';

class Order {
  String? id;
  String? data;
  String? image;
  OrderStatus? orderStatus;
  int? price;

  Order({this.id, this.data, this.image, this.orderStatus, this.price});
}
