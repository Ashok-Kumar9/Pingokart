import 'package:flutter/material.dart';
import 'package:pingokart/utils/constants/color_constants.dart';

class TCartCounterIcon extends StatelessWidget {
  const TCartCounterIcon({super.key, required this.onPressed});
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        IconButton(
          icon: const Icon(Icons.shopping_cart, color: TColors.light),
          onPressed: onPressed,
        ),
        Positioned(
          right: 0,
          top: 0,
          child: Container(
            padding: const EdgeInsets.all(4),
            decoration: const BoxDecoration(
              color: TColors.secondaryColor,
              shape: BoxShape.circle,
            ),
            child: Text(
              '2',
              style: Theme.of(context)
                  .textTheme
                  .labelSmall
                  ?.apply(color: TColors.light),
            ),
          ),
        ),
      ],
    );
  }
}
