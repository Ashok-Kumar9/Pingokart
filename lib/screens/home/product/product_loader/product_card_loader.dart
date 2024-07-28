import 'package:flutter/material.dart';
import 'package:pingokart/utils/constants/color_constants.dart';
import 'package:pingokart/utils/size.dart';
import 'package:pingokart/widgets/shimmer_effect.dart';

class TProductCardLoader extends StatelessWidget {
  const TProductCardLoader({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
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
              children: [const ShimmerEffect(), _buildFavoriteButton()],
            ),
          ),
          const SizedBox(height: 8),
          _buildProductInfo(context),
          _buildPriceAndAddButton(context),
        ],
      ),
    );
  }

  Widget _buildFavoriteButton() {
    return const Positioned(
      top: 8,
      right: 8,
      child: CircleAvatar(
        backgroundColor: Colors.white,
        child: Icon(
          Icons.favorite_border,
          color: Colors.grey,
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
            "product name",
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
            style: Theme.of(context).textTheme.bodyLarge,
          ),
          Text(
            "brand",
            style: Theme.of(context).textTheme.labelSmall,
          ),
        ],
      ),
    );
  }

  Widget _buildPriceAndAddButton(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        const SizedBox(width: 8),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "00",
                style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                      fontWeight: FontWeight.bold,
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
}
