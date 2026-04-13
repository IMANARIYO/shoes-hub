class Category {
  final int id;
  final String name;
  final String image;
  final String description;

  const Category({
    required this.id,
    required this.name,
    required this.image,
    this.description = "",
  });

  factory Category.fromJson(Map<String, dynamic> json) {
    return Category(
      id: json['id'],
      name: json['name'],
      image: json['image'],
      description: json['description'] ?? "",
    );
  }
}
