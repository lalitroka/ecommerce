part of 'cart_bloc.dart';

@immutable
sealed class CartState {}

final class CartInitialState extends CartState {}

class CartSuccessState extends CartState {
  final List<ProductModel> cartListItems;

  CartSuccessState({required this.cartListItems});
}

class CartErrorState extends CartState {}

class CartCountUpdated extends CartState {
  final ProductModel productModel;

  CartCountUpdated({required this.productModel});
}
