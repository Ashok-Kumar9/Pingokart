import 'package:flutter/material.dart';
import 'package:pingokart/provider/navbar_navigation_provider.dart';
import 'package:pingokart/screens/home/home_screen.dart';
import 'package:pingokart/utils/constants/color_constants.dart';
import 'package:pingokart/utils/size.dart';
import 'package:provider/provider.dart';

class NavBarMenu extends StatelessWidget {
  const NavBarMenu({super.key});

  @override
  Widget build(BuildContext context) {
    final navigationProvider = Provider.of<NavBarNavigationProvider>(context);
    return Scaffold(
      body: _getBody(navigationProvider.currentIndex),
      bottomNavigationBar: NavigationBar(
        height: SizeConfig.height * 0.08,
        selectedIndex: navigationProvider.currentIndex,
        backgroundColor: TColors.primaryColor.withOpacity(0.2),
        indicatorColor: TColors.primaryColor,
        onDestinationSelected: (index) {
          navigationProvider.setCurrentIndex(index);
        },
        destinations: [
          NavigationDestination(
            icon: Icon(
              Icons.home_rounded,
              color: navigationProvider.currentIndex == 0
                  ? TColors.light
                  : TColors.primaryColor,
            ),
            label: 'Home',
          ),
          NavigationDestination(
            icon: Icon(
              Icons.store_mall_directory_rounded,
              color: navigationProvider.currentIndex == 1
                  ? TColors.light
                  : TColors.primaryColor,
            ),
            label: 'Store',
          ),
          NavigationDestination(
            icon: Icon(
              Icons.favorite_outline_rounded,
              color: navigationProvider.currentIndex == 2
                  ? TColors.light
                  : TColors.primaryColor,
            ),
            label: 'Wishlist',
          ),
          NavigationDestination(
            icon: Icon(
              Icons.person_rounded,
              color: navigationProvider.currentIndex == 3
                  ? TColors.light
                  : TColors.primaryColor,
            ),
            label: 'Profile',
          ),
        ],
      ),
    );
  }

  Widget _getBody(int index) {
    switch (index) {
      case 0:
        return const HomeScreen();
      case 1:
        return Container(
            color: Colors.yellow.withOpacity(0.2),
            child: const Center(child: Text('Store Screen')));
      case 2:
        return Container(
            color: Colors.green.withOpacity(0.2),
            child: const Center(child: Text('Wishlist Screen')));
      case 3:
        return Container(
            color: Colors.blue.withOpacity(0.2),
            child: const Center(child: Text('Profile Screen')));
      default:
        return const Center(child: Text('Home Screen'));
    }
  }
}
