import 'brand_model.dart';
import 'category_model.dart';
import 'gender_model.dart';
import 'material_model.dart';

class Product {
  final int id;
  final String name;
  final String shortDescription;
  final String slug;
  final bool isPublished;
  final bool isFeatured;
  final bool isActive;
  final Brand brand;
  final Gender gender;
  final Category category;
  final MaterialModel material;

  const Product({
    required this.id,
    required this.name,
    required this.shortDescription,
    required this.slug,
    required this.isPublished,
    required this.isFeatured,
    required this.isActive,
    required this.brand,
    required this.gender,
    required this.category,
    required this.material,
  });

  factory Product.fromJson(Map<String, dynamic> json) {
    return Product(
      id: json['id'],
      name: json['name'],
      shortDescription: json['shortDescription'],
      slug: json['slug'],
      isPublished: json['isPublished'],
      isFeatured: json['isFeatured'],
      isActive: json['isActive'],
      brand: Brand.fromJson(json['brand']),
      gender: Gender.fromJson(json['gender']),
      category: Category.fromJson(json['category']),
      material: MaterialModel.fromJson(json['material']),
    );
  }
}
