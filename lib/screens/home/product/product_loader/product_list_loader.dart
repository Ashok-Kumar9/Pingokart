import 'package:flutter/material.dart';
import 'package:pingokart/screens/home/product/product_loader/product_card_loader.dart';
import 'package:pingokart/utils/size.dart';

class ProductListLoader extends StatelessWidget {
  const ProductListLoader({super.key});

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      padding: const EdgeInsets.all(8.0),
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        mainAxisExtent: SizeConfig.height * 0.28,
        mainAxisSpacing: 8,
        crossAxisSpacing: 8,
      ),
      itemCount: 8,
      itemBuilder: (context, index) {
        return const TProductCardLoader();
      },
    );
  }
}
