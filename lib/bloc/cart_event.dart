part of 'cart_bloc.dart';

class CartEvent {}

class CartInitialEvent extends CartEvent {}

class CartRemoveEvent extends CartEvent {
  final int productitemId;

  CartRemoveEvent({required this.productitemId});
}

class ChechOutEvent extends CartEvent {}

class CartIncrementEvent extends CartEvent {
  final ProductModel productModel;

  CartIncrementEvent({required this.productModel});
}

class CartDecrementEvent extends CartEvent {
  final ProductModel productModel;

  CartDecrementEvent({required this.productModel});
}

class CartUpdateCountEvent extends CartEvent {
  final ProductModel productModel;
  final int newCount;

  CartUpdateCountEvent({required this.productModel, required this.newCount});
}
