import 'package:flutter/material.dart';
import 'package:pingokart/utils/constants/color_constants.dart';
import 'package:pingokart/utils/size.dart';
import 'package:pingokart/widgets/custom_shapes/container/circular_container.dart';
import 'package:pingokart/widgets/custom_shapes/curves/curved_edges.dart';

class HeaderContainer extends StatelessWidget {
  const HeaderContainer({super.key, required this.child});
  final Widget? child;

  @override
  Widget build(BuildContext context) {
    return ClipPath(
      clipper: TCustomCurvedEdges(),
      child: Container(
        color: TColors.primaryColor,
        child: SizedBox(
          height: SizeConfig.height * 0.44,
          child: Stack(
            children: [
              Positioned(
                top: -SizeConfig.width * 0.3,
                right: -SizeConfig.width * 0.6,
                child: CircularContainer(
                  backgroundColor: TColors.light.withOpacity(0.1),
                ),
              ),
              Positioned(
                bottom: -SizeConfig.width * 0.4,
                right: -SizeConfig.width * 0.7,
                child: CircularContainer(
                  backgroundColor: TColors.light.withOpacity(0.1),
                ),
              ),
              child!,
            ],
          ),
        ),
      ),
    );
  }
}
