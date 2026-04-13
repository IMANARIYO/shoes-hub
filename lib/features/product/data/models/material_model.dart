class MaterialModel {
  final int id;
  final String name;
  final String image;

  const MaterialModel({
    required this.id,
    required this.name,
    required this.image,
  });

  factory MaterialModel.fromJson(Map<String, dynamic> json) {
    return MaterialModel(
      id: json['id'],
      name: json['name'],
      image: json['image'],
    );
  }
}
