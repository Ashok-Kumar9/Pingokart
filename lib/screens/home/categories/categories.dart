import 'package:flutter/material.dart';
import 'package:pingokart/models/product_category.dart';
import 'package:pingokart/repository/product_repository.dart';
import 'package:pingokart/screens/home/categories/category_builder.dart';
import 'package:pingokart/screens/home/categories/category_loader.dart';
import 'package:pingokart/utils/constants/color_constants.dart';
import 'package:pingokart/utils/size.dart';

class Categories extends StatelessWidget {
  const Categories({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        Padding(
          padding: const EdgeInsets.only(left: 16.0),
          child: Text(
            'Categories',
            style: Theme.of(context)
                .textTheme
                .headlineMedium
                ?.apply(color: TColors.light),
          ),
        ),
        const SizedBox(height: 16),
        SizedBox(
          height: SizeConfig.height * 0.15,
          child: FutureBuilder(
            future: ProductService().getCategories(),
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting ||
                  snapshot.connectionState == ConnectionState.none) {
                return const CategoryLoader();
              } else if (snapshot.hasError) {
                return Center(
                  child: Center(child: Text('Error: ${snapshot.error}')),
                );
              } else if (snapshot.hasData) {
                final categories = snapshot.data as List<ProductCategory>;
                return CategoryBuilder(categories: categories);
              }
              return const Center(child: Text("No categories found"));
            },
          ),
        ),
      ],
    );
  }
}
