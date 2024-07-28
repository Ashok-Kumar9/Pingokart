import 'package:flutter/material.dart';
import 'package:pingokart/provider/auth_provider.dart';
import 'package:pingokart/screens/home/widgets/cart_icon.dart';
import 'package:pingokart/utils/constants/color_constants.dart';
import 'package:pingokart/widgets/custom_appbar.dart';
import 'package:provider/provider.dart';

class THomeAppBar extends StatelessWidget {
  const THomeAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    final String? userName = context.watch<AuthProvider>().user?.displayName;
    return TAppBar(
      title: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(userName != null ? "Hello $userName" : 'Good day for shopping',
              style: Theme.of(context)
                  .textTheme
                  .headlineSmall
                  ?.apply(color: TColors.grey)),
          Text(
            'Welcome to Pingokart',
            style: Theme.of(context)
                .textTheme
                .labelMedium
                ?.apply(color: TColors.light),
          ),
        ],
      ),
      actions: [TCartCounterIcon(onPressed: () {})],
    );
  }
}
