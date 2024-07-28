import 'package:flutter/material.dart';
import 'package:pingokart/screens/home/categories/categories.dart';
import 'package:pingokart/screens/home/product/product_page.dart';
import 'package:pingokart/screens/home/widgets/header_container.dart';
import 'package:pingokart/screens/home/widgets/home_appbar.dart';
import 'package:pingokart/screens/home/widgets/search_container.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: SingleChildScrollView(
        key: PageStorageKey('home'),
        child: Column(
          children: [
            HeaderContainer(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  THomeAppBar(),
                  SearchContainer(),
                  SizedBox(height: 24),
                  Categories(),
                ],
              ),
            ),
            ProductPage()
          ],
        ),
      ),
    );
  }
}
