import 'dart:convert';

import 'package:consumo_api2/http/exeption/not_found_exception.dart';
import 'package:consumo_api2/http/http_client.dart';
import 'package:consumo_api2/models/products_model.dart';

abstract class IProductRepository {
  Future<List<ProductsModel>> getProducts();
}

class ProductRepository implements IProductRepository {
  final IHttpClient client;
  ProductRepository({
    required this.client,
  });

  @override
  Future<List<ProductsModel>> getProducts() async {
    final response = await client.get(url: 'https://dummyjson.com/products');

    if (response.statusCode == 200) {
      final List<ProductsModel> productList = [];

      final bory = jsonDecode(response.bory);

      bory['products'].map((item) {
        final ProductsModel product = ProductsModel.fromMap(item);
        productList.add(product);
      }).toList();
      return productList;
    } else if (response.statusCode == 400) {
      throw NotFoundException(
        message: 'Porudutos não encontrado. Url informada não é valida',
      );
    } else {
      throw Exception('Não foi possível carregar os Produtos');
    }
  }
}
