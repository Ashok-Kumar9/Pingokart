import 'package:flutter/material.dart';

class ProductCategory {
  String? slug;
  String? name;
  String? url;
  IconData? iconData;

  ProductCategory({
    this.slug,
    this.name,
    this.url,
  }) {
    iconData = _getIconData(name!);
  }

  factory ProductCategory.fromJson(Map<String, dynamic> json) =>
      ProductCategory(
        slug: json["slug"],
        name: json["name"],
        url: json["url"],
      );

  Map<String, dynamic> toJson() => {
        "slug": slug,
        "name": name,
        "url": url,
      };
}

IconData _getIconData(String category) {
  switch (category) {
    case 'Beauty':
      return Icons.brush;
    case 'Fragrances':
      return Icons.flare;
    case 'Furniture':
      return Icons.chair;
    case 'Groceries':
      return Icons.local_grocery_store;
    case 'Home Decoration':
      return Icons.home;
    case 'Kitchen Accessories':
      return Icons.kitchen;
    case 'Laptops':
      return Icons.laptop;
    case 'Mens Shoes':
      return Icons.hiking;
    case 'Mens Watches':
      return Icons.watch;
    case 'Mobile Accessories':
      return Icons.phone_android;
    case 'Motorcycle':
      return Icons.motorcycle;
    case 'Skin Care':
      return Icons.spa;
    case 'Smartphones':
      return Icons.smartphone;
    case 'Sports Accessories':
      return Icons.sports;
    case 'Sunglasses':
      return Icons.sunny;
    case 'Tablets':
      return Icons.tablet;
    case 'Tops':
      return Icons.checkroom;
    case 'Vehicle':
      return Icons.directions_car;
    case 'Womens Bags':
      return Icons.shopping_bag;
    case 'Womens Jewellery':
      return Icons.diamond;
    case 'Womens Shoes':
      return Icons.woman;
    case 'Womens Watches':
      return Icons.watch;
    default:
      return Icons.shopping_bag;
  }
}
