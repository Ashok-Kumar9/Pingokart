import 'package:flutter/material.dart';
import 'package:pingokart/utils/constants/color_constants.dart';
import 'package:pingokart/utils/size.dart';

class CircularContainer extends StatelessWidget {
  const CircularContainer({
    super.key,
    this.height,
    this.width,
    this.child,
    this.radius,
    this.padding,
    this.backgroundColor,
  });

  final double? height;
  final double? width;
  final Widget? child;
  final double? radius;
  final double? padding;
  final Color? backgroundColor;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height ?? SizeConfig.width,
      width: width ?? SizeConfig.width,
      padding: EdgeInsets.all(padding ?? 0),
      decoration: radius == null
          ? BoxDecoration(
              color: backgroundColor ?? TColors.light,
              shape: BoxShape.circle,
            )
          : BoxDecoration(
              color: backgroundColor ?? TColors.light,
              borderRadius: BorderRadius.circular(radius!),
            ),
      child: child,
    );
  }
}
