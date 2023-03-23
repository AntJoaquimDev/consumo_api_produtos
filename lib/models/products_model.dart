import 'dart:convert';

class ProductsModel {
  final String title;
  final String description;
  final double price;
  final double discountPercentage;
  final double rating;
  final int stock;
  final String brand;
  final String category;
  final String thumbnail;
  final List<String> images;

  ProductsModel({
    required this.title,
    required this.description,
    required this.price,
    required this.discountPercentage,
    required this.rating,
    required this.stock,
    required this.brand,
    required this.category,
    required this.thumbnail,
    required this.images,
  });

  Map<String, dynamic> toMap() {
    return {
      "title": title,
      "description": description,
      "price": price,
      "discountPercentage": discountPercentage,
      "rating": rating,
      "stock": stock,
      "brand": brand,
      "category": category,
      "thumbnail": thumbnail,
      "images": images,
    };
  }

  factory ProductsModel.fromMap(Map<String, dynamic> map) {
    return ProductsModel(
      title: map[' title'] ?? '',
      description: map[' description'] ?? '',
      price: map[' price'] * 1.0,
      discountPercentage: map[' discountPercentage'] * 1.0,
      rating: map[' rating'] * 1.0,
      stock: map[' stock'] * 1.0,
      brand: map[' brand'] ?? '',
      category: map[' category'] ?? '',
      thumbnail: map[' thumbnail'] ?? '',
      images: List<String>.from(
        map[' images'] as List,
      ),
    );
  }

  String toJson() => json.encode(toMap());

  factory ProductsModel.fromJson(String source) =>
      ProductsModel.fromMap(json.decode(source));
}
