import 'package:flutter/material.dart';
import '../../../../data/models/product/gender_model.dart';

class GendersScreen extends StatelessWidget {
  final List<Gender> genders;

  const GendersScreen({super.key, required this.genders});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Genders')),
      body: ListView.builder(
        itemCount: genders.length,
        itemBuilder: (context, index) {
          final gender = genders[index];

          return ListTile(
            leading: CircleAvatar(backgroundImage: NetworkImage(gender.image)),
            title: Text(gender.name),
            subtitle: Text('ID: ${gender.id}'),
            onTap: () {
              Navigator.pushNamed(
                context,
                '/products',
                arguments: {'genderId': gender.id},
              );
            },
          );
        },
      ),
    );
  }
}
