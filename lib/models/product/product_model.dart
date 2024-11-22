class ProductModel {
  final int id;
  int count;
  final String productName;
  final double price;
  final int quantity;

  ProductModel(
      {required this.id,
      required this.count,
      required this.productName,
      required this.price,
      required this.quantity});
}
