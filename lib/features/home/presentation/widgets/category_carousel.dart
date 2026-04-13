import 'package:flutter/material.dart';

import 'package:shoes_hub_mobile_app/features/product/data/datasources/local/product_category_local_data.dart';
import 'package:shoes_hub_mobile_app/features/home/presentation/widgets/category_card.dart';

class CategoryCarousel extends StatelessWidget {
  const CategoryCarousel({super.key});

  @override
  Widget build(BuildContext context) {
    return CarouselView.weighted(
      scrollDirection: Axis.horizontal,
      consumeMaxWeight: true,
      itemSnapping: true,
      flexWeights: [4, 4, 4, 4], // all children equal weight
      children: categoriesList.map((category) {
        return CategoryCard(category: category);
      }).toList(),
    );
  }
}
