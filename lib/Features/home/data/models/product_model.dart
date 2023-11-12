class ProductModel {
  final String name;
  final double priceAfter;
  final double priceBefore;
  String? description;
  String? id;

  ProductModel(
      {required this.name,
      required this.priceAfter,
      required this.priceBefore,
      this.id});
}
