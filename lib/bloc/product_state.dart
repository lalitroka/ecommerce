import 'package:demoproject/models/product/product_model.dart';

class ProductState {}

abstract class ProductActionState extends ProductState {}

class ProductInitialState extends ProductState {}

class ProductLoadingState extends ProductState {}

class ProductLoadSuccessState extends ProductState {
  final List<ProductModel> products;

  ProductLoadSuccessState({required this.products});
}

class ProdcutErrorState extends ProductState {}

class ProductCartedState extends ProductActionState {}


// class HomeState {}

// abstract class HomeActionState extends HomeState {}

// class HomeInitialState extends HomeState {}

// class HomeLoadingState extends HomeState {}

// class HomeLoadSuccessState extends HomeState {
//   final List<ProductModel> product;

//   HomeLoadSuccessState({required this.product});
// }

// class HomeErrorState extends HomeState {}

// class HomeWishListNavigateState extends HomeActionState {}

// class HomeWishListClickState extends HomeActionState {}
