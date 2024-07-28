import 'package:flutter/material.dart';
import 'package:pingokart/utils/constants/color_constants.dart';
import 'package:pingokart/utils/size.dart';

class CategoryLoader extends StatelessWidget {
  const CategoryLoader({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      shrinkWrap: true,
      itemCount: 8,
      scrollDirection: Axis.horizontal,
      itemBuilder: (context, index) {
        return Container(
          width: SizeConfig.width * 0.22,
          padding: const EdgeInsets.only(left: 16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                padding: const EdgeInsets.all(16),
                margin: const EdgeInsets.only(bottom: 8),
                decoration: BoxDecoration(
                  color: TColors.light,
                  borderRadius: BorderRadius.circular(100),
                  boxShadow: [
                    BoxShadow(
                      color: TColors.secondaryColor.withOpacity(0.5),
                      blurRadius: 3,
                      offset: const Offset(0, 4),
                    ),
                  ],
                ),
                child: const SizedBox(
                  width: 32,
                  height: 32,
                  child: CircularProgressIndicator(
                    valueColor:
                        AlwaysStoppedAnimation<Color>(TColors.primaryColor),
                    strokeWidth: 2,
                  ),
                ),
              ),
              Text(
                'Category $index',
                style: Theme.of(context)
                    .textTheme
                    .labelMedium
                    ?.apply(color: TColors.light),
              ),
            ],
          ),
        );
      },
    );
  }
}
