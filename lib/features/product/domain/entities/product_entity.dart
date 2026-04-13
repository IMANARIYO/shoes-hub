// Domain entity — pure Dart, no framework dependencies
class ProductEntity {
  final int id;
  final String name;
  final String shortDescription;
  final String slug;
  final bool isPublished;
  final bool isFeatured;
  final bool isActive;
  final String brandName;
  final String genderName;
  final String categoryName;
  final String materialName;

  const ProductEntity({
    required this.id,
    required this.name,
    required this.shortDescription,
    required this.slug,
    required this.isPublished,
    required this.isFeatured,
    required this.isActive,
    required this.brandName,
    required this.genderName,
    required this.categoryName,
    required this.materialName,
  });
}
