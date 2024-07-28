import 'package:flutter/material.dart';
import 'package:pingokart/utils/constants/color_constants.dart';

class SearchContainer extends StatelessWidget {
  const SearchContainer({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(14),
      margin: const EdgeInsets.symmetric(horizontal: 16).copyWith(
        top: 16,
      ),
      decoration: BoxDecoration(
        color: TColors.light,
        borderRadius: BorderRadius.circular(8),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.2),
            blurRadius: 8,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Row(
        children: [
          Icon(
            Icons.search,
            color: TColors.secondaryColor.withOpacity(0.5),
          ),
          const SizedBox(width: 8),
          Text(
            'Search for products',
            style: Theme.of(context).textTheme.bodySmall?.apply(
                  color: TColors.secondaryColor.withOpacity(0.5),
                ),
          ),
        ],
      ),
    );
  }
}
