import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pingokart/bloc/product_bloc/products_bloc.dart';
import 'package:pingokart/bloc/product_bloc/products_event.dart';
import 'package:pingokart/models/product_category.dart';
import 'package:pingokart/utils/constants/color_constants.dart';
import 'package:pingokart/utils/size.dart';

class CategoryBuilder extends StatefulWidget {
  const CategoryBuilder({super.key, required this.categories});
  final List<ProductCategory> categories;

  @override
  State<CategoryBuilder> createState() => _CategoryBuilderState();
}

class _CategoryBuilderState extends State<CategoryBuilder> {
  int? currentCategoryIndex;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      shrinkWrap: true,
      itemCount: widget.categories.length,
      scrollDirection: Axis.horizontal,
      itemBuilder: (context, index) {
        return GestureDetector(
          onTap: () {
            setState(() {
              if (currentCategoryIndex == index) {
                currentCategoryIndex = null;
                context.read<ProductBloc>().add(FetchProducts());
              } else {
                currentCategoryIndex = index;
                context.read<ProductBloc>().add(
                    FetchProducts(category: widget.categories[index].name));
              }
            });
          },
          child: Container(
            width: SizeConfig.width * 0.22,
            padding: const EdgeInsets.only(left: 16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Container(
                  padding: const EdgeInsets.all(16),
                  margin: const EdgeInsets.only(bottom: 8),
                  decoration: BoxDecoration(
                    color: currentCategoryIndex == index
                        ? TColors.grey
                        : TColors.light,
                    borderRadius: BorderRadius.circular(100),
                    boxShadow: [
                      BoxShadow(
                        color: TColors.secondaryColor.withOpacity(0.5),
                        blurRadius: 3,
                        offset: const Offset(0, 4),
                      ),
                    ],
                  ),
                  child: Icon(
                    widget.categories[index].iconData ?? Icons.shopping_cart,
                    size: 32,
                  ),
                ),
                Text(
                  widget.categories[index].name ?? 'Category $index',
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: Theme.of(context)
                      .textTheme
                      .labelMedium
                      ?.apply(color: TColors.light),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
