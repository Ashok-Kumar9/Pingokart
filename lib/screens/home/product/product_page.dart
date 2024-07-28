import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pingokart/bloc/product_bloc/products_bloc.dart';
import 'package:pingokart/bloc/product_bloc/products_event.dart';
import 'package:pingokart/bloc/product_bloc/products_state.dart';
import 'package:pingokart/provider/remote_config_provider.dart';
import 'package:pingokart/screens/home/product/product_loader/product_list_loader.dart';
import 'package:provider/provider.dart';

import 'product_builder/product_list_builder.dart';

class ProductPage extends StatefulWidget {
  const ProductPage({super.key, this.category});

  final String? category;

  @override
  State<ProductPage> createState() => _ProductPageState();
}

class _ProductPageState extends State<ProductPage> {
  @override
  void initState() {
    super.initState();
    context.read<ProductBloc>().add(FetchProducts(category: widget.category));
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ProductBloc, ProductState>(
      builder: (context, state) {
        if (state is ProductLoading) {
          return const ProductListLoader();
        } else if (state is ProductLoaded) {
          return Consumer<RemoteConfigProvider>(
            builder: (context, remoteConfig, child) {
              return ProductListBuilder(
                state: state,
                showDiscountedPrice: remoteConfig.showDiscountedPrice,
              );
            },
          );
        } else if (state is ProductError) {
          return Center(child: Text(state.message));
        }
        return Container();
      },
    );
  }
}
