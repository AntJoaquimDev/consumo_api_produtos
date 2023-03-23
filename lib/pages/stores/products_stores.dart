import 'package:consumo_api2/http/exeption/not_found_exception.dart';
import 'package:flutter/cupertino.dart';

import 'package:consumo_api2/models/products_model.dart';
import 'package:consumo_api2/repositories/product_repository.dart';

class ProductsStores {
  final IProductRepository repository;
  ProductsStores({
    required this.repository,
  });

  //Variavel reativa para loading
  final ValueNotifier<bool> isLoading = ValueNotifier<bool>(false);
  //Variavel reativa para state
  final ValueNotifier<List<ProductsModel>> state =
      ValueNotifier<List<ProductsModel>>([]);
  //Variavel reativa para erro
  final ValueNotifier<String> error = ValueNotifier<String>('');

  getProducts() async {
    isLoading.value = true;
    try {
      final result = await repository.getProducts();
      state.value = result;
    } on NotFoundException catch (e) {
      error.value = e.message;
    } catch (e) {
      error.value = e.toString();
    }
    isLoading.value = false;
  }
}
