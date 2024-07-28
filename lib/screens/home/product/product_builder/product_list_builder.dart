import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pingokart/bloc/product_bloc/products_bloc.dart';
import 'package:pingokart/bloc/product_bloc/products_event.dart';
import 'package:pingokart/bloc/product_bloc/products_state.dart';
import 'package:pingokart/screens/home/product/product_builder/product_card_vertical.dart';
import 'package:pingokart/utils/constants/image_constants.dart';
import 'package:pingokart/utils/size.dart';

class ProductListBuilder extends StatelessWidget {
  const ProductListBuilder(
      {super.key, required this.state, required this.showDiscountedPrice});

  final ProductLoaded state;
  final bool showDiscountedPrice;

  @override
  Widget build(BuildContext context) {
    return state.products.isEmpty
        ? Center(
            child: Column(
            children: [
              SizedBox(
                height: SizeConfig.height * 0.1,
                child: Image.asset(ImageConstants.noProduct),
              ),
              const Text("No Products Found for this Category"),
              const SizedBox(height: 16),
              TextButton(
                style: TextButton.styleFrom(
                  side: const BorderSide(color: Colors.black),
                  padding: const EdgeInsets.symmetric(horizontal: 24.0),
                ),
                onPressed: () {
                  context.read<ProductBloc>().add(FetchProducts());
                },
                child: const Text("Fetch All Products"),
              ),
            ],
          ))
        : GridView.builder(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            padding: const EdgeInsets.all(8.0),
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              mainAxisExtent: SizeConfig.height * 0.28,
              mainAxisSpacing: 8,
              crossAxisSpacing: 8,
            ),
            itemCount: state.products.length,
            itemBuilder: (context, index) {
              return TProductCardVertical(
                product: state.products[index],
                showDiscountedPrice: showDiscountedPrice,
              );
            },
          );
  }
}
