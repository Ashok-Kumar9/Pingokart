import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:pingokart/models/product_category.dart';
import 'package:pingokart/models/products.dart';

class ProductService {
  final String baseUrl = 'https://dummyjson.com/products';

  Future<List<Product>> getProducts({String? category}) async {
    final url = category != null ? '$baseUrl/category/$category' : baseUrl;
    final response = await http.get(Uri.parse(url));

    if (response.statusCode == 200) {
      final jsonData = json.decode(response.body);
      final productsJson = jsonData['products'] as List;
      return productsJson.map((json) => Product.fromJson(json)).toList();
    } else {
      throw Exception('Failed to load products');
    }
  }

  Future<List<ProductCategory>> getCategories() async {
    final response = await http.get(Uri.parse('$baseUrl/categories'));

    if (response.statusCode == 200) {
      return (json.decode(response.body) as List)
          .map((json) => ProductCategory.fromJson(json))
          .toList();
    } else {
      throw Exception('Failed to load categories');
    }
  }
}
