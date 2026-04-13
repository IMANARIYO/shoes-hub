import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:shoes_hub_mobile_app/features/product/data/models/category_model.dart';

class CategoryCard extends StatelessWidget {
  final Category category;
  final VoidCallback? onTap;

  const CategoryCard({super.key, required this.category, this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap:
          onTap ??
          () {
            // Default navigation to category products
            context.go('/products', extra: category);
          },
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          // Circular image container
          Container(
            height: 70,
            width: 70,
            decoration: BoxDecoration(
              image: DecorationImage(
                image: NetworkImage(category.image),
                fit: BoxFit.contain,
              ),
            ),
          ),
          const SizedBox(height: 12),
          // Category name
          Text(
            category.name,
            style: const TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold,
              color: Colors.black87,
            ),
            maxLines: 1,
            overflow: TextOverflow.fade,
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }
}
