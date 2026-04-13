import 'package:flutter/material.dart';
import 'package:shoes_hub_mobile_app/data/models/product/material_model.dart';

class MaterialsScreen extends StatelessWidget {
  final List<MaterialModel> materials;

  const MaterialsScreen({super.key, required this.materials});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Materials')),
      body: ListView.builder(
        itemCount: materials.length,
        itemBuilder: (context, index) {
          final material = materials[index];

          return ListTile(
            title: Text(material.name),
            subtitle: Text('ID: ${material.id}'),
            trailing: const Icon(Icons.chevron_right),
            onTap: () {
              Navigator.pushNamed(
                context,
                '/products',
                arguments: {'materialId': material.id},
              );
            },
          );
        },
      ),
    );
  }
}
