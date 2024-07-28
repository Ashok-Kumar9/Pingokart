import 'package:flutter/material.dart';
import 'package:pingokart/models/products.dart';
import 'package:pingokart/utils/constants/color_constants.dart';
import 'package:pingokart/utils/size.dart';
import 'package:pingokart/widgets/custom_image.dart';

class ProductDetailPage extends StatelessWidget {
  final Product product;

  const ProductDetailPage({Key? key, required this.product}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          _buildAppBar(),
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  _buildTitle(context),
                  const SizedBox(height: 8),
                  _buildPriceInfo(),
                  const SizedBox(height: 16),
                  _buildRatingInfo(),
                  const SizedBox(height: 16),
                  _buildDescription(),
                  const SizedBox(height: 16),
                  _buildProductDetails(),
                  const SizedBox(height: 16),
                  _buildTags(),
                  const SizedBox(height: 16),
                  _buildReviews(),
                ],
              ),
            ),
          ),
        ],
      ),
      bottomNavigationBar: _buildBottomAppBar(),
    );
  }

  Widget _buildAppBar() {
    return SliverAppBar(
      backgroundColor: Colors.white,
      expandedHeight: SizeConfig.height * 0.4,
      floating: false,
      pinned: true,
      flexibleSpace: FlexibleSpaceBar(
        background: CustomImage(
          imageUrl: product.thumbnail ?? '',
          fit: BoxFit.cover,
        ),
      ),
      actions: [
        IconButton(icon: const Icon(Icons.favorite_border), onPressed: () {}),
        IconButton(icon: const Icon(Icons.share), onPressed: () {}),
      ],
    );
  }

  Widget _buildTitle(BuildContext context) {
    return Text(
      product.title ?? 'No Title',
      style: Theme.of(context).textTheme.headlineSmall?.copyWith(
            fontWeight: FontWeight.bold,
          ),
    );
  }

  Widget _buildPriceInfo() {
    return Row(
      children: [
        Text(
          '\$${product.price?.toStringAsFixed(2) ?? 'N/A'}',
          style: const TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.bold,
          ),
        ),
        const SizedBox(width: 16),
        if (product.discountPercentage != null)
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
            decoration: BoxDecoration(
              color: Colors.green.withOpacity(0.8),
              borderRadius: BorderRadius.circular(12),
            ),
            child: Text(
              '${product.discountPercentage?.toStringAsFixed(1)}% OFF',
              style: const TextStyle(
                  color: Colors.white, fontWeight: FontWeight.bold),
            ),
          ),
      ],
    );
  }

  Widget _buildRatingInfo() {
    return Row(
      children: [
        ...List.generate(
          5,
          (index) => Icon(
            index < (product.rating ?? 0).floor()
                ? Icons.star
                : Icons.star_border,
            color: Colors.amber,
          ),
        ),
        const SizedBox(width: 8),
        Text(
            '${product.rating?.toStringAsFixed(1) ?? 'N/A'} (${product.reviews?.length ?? 0} reviews)'),
      ],
    );
  }

  Widget _buildDescription() {
    return Text(
      product.description ?? 'No description available.',
      style: const TextStyle(fontSize: 16),
    );
  }

  Widget _buildProductDetails() {
    return Container(
      padding: const EdgeInsets.all(16.0),
      decoration: BoxDecoration(
        color: TColors.primaryColor.withOpacity(0.1),
        borderRadius: BorderRadius.circular(8),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _buildDetailRow('Brand', product.brand),
          _buildDetailRow('SKU', product.sku),
          _buildDetailRow('Weight', '${product.weight ?? 'N/A'} g'),
          _buildDetailRow('Dimensions', _formatDimensions()),
          _buildDetailRow('Warranty', product.warrantyInformation),
          _buildDetailRow('Shipping', product.shippingInformation),
          _buildDetailRow(
            'Availability',
            product.availabilityStatus,
            color: product.availabilityStatus == 'Low Stock'
                ? Colors.orange
                : Colors.green,
          ),
        ],
      ),
    );
  }

  Widget _buildDetailRow(String label, String? value, {Color? color}) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 8.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text('$label:', style: const TextStyle(fontWeight: FontWeight.bold)),
          Text(value ?? 'N/A', style: TextStyle(color: color)),
        ],
      ),
    );
  }

  String _formatDimensions() {
    if (product.dimensions == null) return 'N/A';
    return '${product.dimensions!.width} x ${product.dimensions!.height} x ${product.dimensions!.depth} cm';
  }

  Widget _buildTags() {
    return Wrap(
      spacing: 8,
      runSpacing: 8,
      children: product.tags
              ?.map((tag) => Chip(
                    backgroundColor: TColors.primaryColor.withOpacity(0.1),
                    label: Text(tag),
                  ))
              .toList() ??
          [],
    );
  }

  Widget _buildReviews() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'Reviews:',
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
        ),
        const SizedBox(height: 8),
        ...?product.reviews?.map(_buildReviewItem),
      ],
    );
  }

  Widget _buildReviewItem(Review review) {
    return Container(
      decoration: BoxDecoration(
        color: TColors.primaryColor.withOpacity(0.1),
        borderRadius: BorderRadius.circular(8),
      ),
      margin: const EdgeInsets.only(bottom: 8),
      child: ListTile(
        title: Text(review.reviewerName ?? 'Anonymous'),
        subtitle: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(review.comment ?? 'No comment'),
            const SizedBox(height: 4),
            Text(
              review.date.toString().split(' ')[0],
              style: const TextStyle(fontSize: 12, color: Colors.grey),
            ),
          ],
        ),
        trailing: Row(
          mainAxisSize: MainAxisSize.min,
          children: List.generate(
            5,
            (index) => Icon(
              index < (review.rating ?? 0) ? Icons.star : Icons.star_border,
              color: Colors.amber,
              size: 16,
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildBottomAppBar() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      child: ElevatedButton(
        onPressed: () {},
        style: ElevatedButton.styleFrom(
          padding: const EdgeInsets.symmetric(vertical: 16),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8),
          ),
        ),
        child: const Text('Add to Cart'),
      ),
    );
  }
}
