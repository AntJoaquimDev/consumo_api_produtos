import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:consumo_api2/http/exeption/not_found_exception.dart';
import 'package:consumo_api2/http/http_client.dart';
import 'package:consumo_api2/models/products_model.dart';

abstract class IProductRepository {
  Future<List<ProductsModel>> getProducts();
}

//var response = await http.get(url);
class ProductRepository implements IProductRepository {
  final IHttpClient response;
  ProductRepository({
    required this.response,
  });

  @override
  Future<List<ProductsModel>> getProducts() async {
    final responseProduct =
        await response.get(url: 'https://dummyjson.com/products');
    final productList = jsonDecode(responseProduct.body);
    if (responseProduct.statusCode == 200) {
      final List<ProductsModel> products = [];
      productList['products'].map((item) {
        final ProductsModel product = ProductsModel.fromMap(item);
        products.add(product);
      }).toList();
      return products;
    } else if (responseProduct.statusCode == 404) {
      throw NotFoundException(
        message: 'Porudutos não encontrado. Url informada não é valida',
      );
    } else {
      throw Exception('Não foi possível carregar os Produtos');
    }
  }
}
