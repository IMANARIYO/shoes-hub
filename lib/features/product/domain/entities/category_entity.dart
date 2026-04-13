// Domain entity — pure Dart, no framework dependencies
class CategoryEntity {
  final int id;
  final String name;
  final String image;
  final String description;

  const CategoryEntity({
    required this.id,
    required this.name,
    required this.image,
    this.description = "",
  });
}
