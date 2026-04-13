import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:shoes_hub_mobile_app/features/product/data/datasources/local/product_category_local_data.dart';
import 'package:shoes_hub_mobile_app/features/home/presentation/widgets/category_tile.dart';

class CategoriesScreen extends StatelessWidget {
  const CategoriesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        context.pop();
        return false;
      },
      child: Scaffold(
        appBar: AppBar(
          title: const Text("Categories"),
          centerTitle: true,
          elevation: 0,
          leading: IconButton(
            icon: const Icon(Icons.access_alarms_sharp),
            onPressed: () {
              context.pop(); // <-- GoRouter pop
            },
          ),
        ),
        body: ListView.builder(
          padding: const EdgeInsets.only(top: 12, bottom: 16),
          itemCount: categoriesList.length,
          itemBuilder: (context, index) {
            final category = categoriesList[index];
            return CategoryTile(category: category);
          },
        ),
      ),
    );
  }
}
