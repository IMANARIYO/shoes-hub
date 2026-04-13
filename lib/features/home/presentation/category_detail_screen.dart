import 'package:flutter/material.dart';
import 'package:shoes_hub_mobile_app/features/product/data/models/category_model.dart';

class CategoryDetailScreen extends StatelessWidget {
  final Category? category; // optional if passed via extra
  final String categoryId; // mandatory from route

  const CategoryDetailScreen({
    super.key,
    this.category,
    required this.categoryId,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(category?.name ?? 'Category Details')),
      body: Center(
        child: Text(
          'Category ID: $categoryId\nCategory Name: ${category?.name ?? 'Unknown'}',
          textAlign: TextAlign.center,
        ),
      ),
    );
  }
}
