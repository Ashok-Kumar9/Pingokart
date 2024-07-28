import 'package:flutter/material.dart';
import 'package:pingokart/models/product_category.dart';
import 'package:pingokart/screens/home/product/product_page.dart';

class CategoryPage extends StatelessWidget {
  const CategoryPage({super.key, required this.productCategory});

  final ProductCategory productCategory;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Row(
          children: [
            Icon(productCategory.iconData),
            const SizedBox(width: 8),
            Text(
              productCategory.name.toString(),
            ),
          ],
        ),
      ),
      body: ProductPage(category: productCategory.name),
    );
  }
}
