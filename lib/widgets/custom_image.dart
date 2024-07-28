import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:pingokart/utils/size.dart';
import 'package:pingokart/widgets/shimmer_effect.dart';

class CustomImage extends StatelessWidget {
  const CustomImage({
    super.key,
    required this.imageUrl,
    this.height,
    this.width,
    this.fit = BoxFit.cover,
    this.borderRadius,
    this.errorWidget,
  });

  final String imageUrl;
  final double? height;
  final double? width;
  final BoxFit fit;
  final BorderRadius? borderRadius;
  final Widget? errorWidget;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: height ?? SizeConfig.width,
      height: width ?? SizeConfig.height,
      decoration: BoxDecoration(
        color: Colors.grey.withOpacity(0.2),
        borderRadius: BorderRadius.circular(12),
      ),
      child: ClipRRect(
        borderRadius: borderRadius ?? BorderRadius.circular(0),
        child: CachedNetworkImage(
          imageUrl: imageUrl,
          height: height,
          width: width,
          fit: fit,
          placeholder: (context, url) => const ShimmerEffect(),
          errorWidget: (context, url, error) => _buildErrorWidget(),
        ),
      ),
    );
  }

  Widget _buildErrorWidget() {
    return errorWidget ??
        const Icon(
          Icons.error_outline,
          color: Colors.red,
          size: 30,
        );
  }
}
