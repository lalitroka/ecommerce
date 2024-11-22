import 'dart:async';
import 'dart:developer';

import 'package:demoproject/models/card/card_item.dart';
import 'package:demoproject/models/product/product_model.dart';
import 'package:demoproject/viewmodels/product/product_view_model.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'product_event.dart';
import 'product_state.dart';

class ProductBloc extends Bloc<ProductEvent, ProductState> {
  final List<ProductModel> _allProducts = [];
  ProductBloc() : super(ProductInitialState()) {
    on<ProductInitialEvent>(productInitialEvent);
    on<ProductSearchEvent>(productSearchEvent);
    on<ProductCartedEvent>(productCartedEvent);
  }

  FutureOr<void> productInitialEvent(
      ProductInitialEvent event, Emitter<ProductState> emit) async {
    emit(ProductLoadingState());

    try {
      await Future.delayed(const Duration(microseconds: 10));
      final products = ProductItem.productItem
          .map((e) => ProductModel(
                id: e['id'],
                count: e['count'],
                productName: e['productName'],
                price: e['price'],
                quantity: e['quantity'],
              ))
          .toList();
      _allProducts.addAll(products);

      emit(ProductLoadSuccessState(products: products));
    } catch (e, stacktrace) {
      log('Error in productInitialEvent: $e');
      log('Stacktrace: $stacktrace');
      emit(ProdcutErrorState());
    }
  }

  FutureOr<void> productSearchEvent(
      ProductSearchEvent event, Emitter<ProductState> emit) {
    final query = event.query.toLowerCase();
    final filteredProducts = _allProducts
        .where((product) => product.productName.toLowerCase().contains(query))
        .toList();
    emit(ProductLoadSuccessState(products: filteredProducts));
  }

  FutureOr<void> productCartedEvent(event, Emitter<ProductState> emit) {
    cartListItem.add(event.clickProduct);
    emit(ProductCartedState());
  }
}
