import 'package:flutter/material.dart';
import 'package:pingokart/models/products.dart';
import 'package:pingokart/screens/home/product/details_page.dart';
import 'package:pingokart/utils/constants/color_constants.dart';
import 'package:pingokart/utils/size.dart';
import 'package:pingokart/widgets/custom_image.dart';

class TProductCardVertical extends StatelessWidget {
  final VoidCallback? onFavoriteToggle;
  final bool isFavorite;
  final double imageHeight;
  final Product product;
  final bool showDiscountedPrice;

  const TProductCardVertical({
    super.key,
    this.onFavoriteToggle,
    this.isFavorite = false,
    this.imageHeight = 160,
    required this.product,
    required this.showDiscountedPrice,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => ProductDetailPage(product: product),
          ),
        );
      },
      child: Container(
        width: SizeConfig.width * 0.45,
        height: SizeConfig.height * 0.28,
        padding: const EdgeInsets.all(2),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12),
          color: TColors.grey.withOpacity(0.2),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              child: Stack(
                children: [
                  CustomImage(
                    imageUrl: product.thumbnail ?? '',
                    width: double.infinity,
                    fit: BoxFit.cover,
                  ),
                  _buildFavoriteButton(),
                  if (showDiscountedPrice && product.discountPercentage != null)
                    _buildDiscountTag(context),
                ],
              ),
            ),
            const SizedBox(height: 8),
            _buildProductInfo(context),
            _buildPriceAndAddButton(context, showDiscountedPrice),
          ],
        ),
      ),
    );
  }

  Widget _buildFavoriteButton() {
    return Positioned(
      top: 8,
      right: 8,
      child: GestureDetector(
        onTap: onFavoriteToggle,
        child: CircleAvatar(
          backgroundColor: Colors.white,
          child: Icon(
            isFavorite ? Icons.favorite : Icons.favorite_border,
            color: isFavorite ? Colors.red : Colors.grey,
          ),
        ),
      ),
    );
  }

  Widget _buildDiscountTag(BuildContext context) {
    return Positioned(
      top: 1,
      left: 1,
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 4),
        decoration: const BoxDecoration(
          color: Colors.orange,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(12),
            bottomRight: Radius.circular(12),
          ),
        ),
        child: Text(
          '${product.discountPercentage!.toStringAsFixed(2)}% OFF',
          style: Theme.of(context)
              .textTheme
              .labelMedium
              ?.copyWith(color: Colors.white),
        ),
      ),
    );
  }

  Widget _buildProductInfo(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            product.title ?? '',
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
            style: Theme.of(context).textTheme.bodyLarge,
          ),
          Text(
            product.brand ?? '',
            style: Theme.of(context).textTheme.labelSmall,
          ),
        ],
      ),
    );
  }

  Widget _buildPriceAndAddButton(
      BuildContext context, bool showDiscountedPrice) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        const SizedBox(width: 8),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                showDiscountedPrice
                    ? '\$${_calculateDiscountedPrice().toStringAsFixed(2)}'
                    : '\$${product.price?.toStringAsFixed(2) ?? ''}',
                style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                      fontWeight: FontWeight.bold,
                    ),
              ),
              if (showDiscountedPrice)
                Text(
                  '\$${product.price?.toStringAsFixed(2) ?? ''}',
                  style: Theme.of(context).textTheme.labelMedium?.copyWith(
                        decoration: TextDecoration.lineThrough,
                        color: Colors.grey,
                      ),
                ),
            ],
          ),
        ),
        Container(
          padding: const EdgeInsets.all(6),
          decoration: const BoxDecoration(
            color: TColors.primaryColor,
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(12),
              bottomRight: Radius.circular(12),
            ),
          ),
          child: const Icon(
            Icons.add,
            color: Colors.white,
          ),
        ),
      ],
    );
  }

  double _calculateDiscountedPrice() {
    if (product.price == null || product.discountPercentage == null) return 0;
    return product.price! * (1 - product.discountPercentage! / 100);
  }
}
