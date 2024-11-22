import 'package:demoproject/models/product/product_model.dart';

abstract class ProductEvent {}

class ProductInitialEvent extends ProductEvent {}

class ProductCartedEvent extends ProductEvent {
  final ProductModel clickProduct;

  ProductCartedEvent({required this.clickProduct});
}

class ProductSearchEvent extends ProductEvent {
  final String query;

  ProductSearchEvent({required this.query});
}



// class HomeEvent {}

// class HomeInitialEvent extends HomeEvent {}

// class HomeWishListClickEvent extends HomeEvent {
//   final ProductModel clickProduct;

//   HomeWishListClickEvent({required this.clickProduct});
// }

// class HomeWishListNavigateEvent extends HomeEvent {}
