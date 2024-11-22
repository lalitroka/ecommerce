import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:demoproject/models/card/card_item.dart';
import 'package:demoproject/models/product/product_model.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';

part 'cart_event.dart';
part 'cart_state.dart';

class CartBloc extends Bloc<CartEvent, CartState> {
  CartBloc() : super(CartInitialState()) {
    on<CartInitialEvent>(cartInitialEvent);
    on<CartRemoveEvent>(cartRemoveEvent);
    on<CartUpdateCountEvent>(cartCountUpdatedEvent);
  }

  FutureOr<void> cartInitialEvent(
      CartInitialEvent event, Emitter<CartState> emit) {
    emit(CartSuccessState(cartListItems: cartListItem));
  }

  FutureOr<void> cartRemoveEvent(
      CartRemoveEvent event, Emitter<CartState> emit) {
    cartListItem.removeWhere((item) => item.id == event.productitemId);
    emit(CartSuccessState(cartListItems: List.from(cartListItem)));
  }

  FutureOr<void> cartCountUpdatedEvent(
      CartUpdateCountEvent event, Emitter<CartState> emit) {
    final index = cartListItem.indexOf(event.productModel);
    if (index != -1) {
      int newCount = event.newCount;

      if (newCount >= 1) {
        cartListItem[index].count = newCount;
      }
      emit(CartCountUpdated(productModel: cartListItem as ProductModel));
    }
  }
}
