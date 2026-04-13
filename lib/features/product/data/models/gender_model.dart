class Gender {
  final int id;
  final String name;
  final String image;

  const Gender({required this.id, required this.name, required this.image});

  factory Gender.fromJson(Map<String, dynamic> json) {
    return Gender(id: json['id'], name: json['name'], image: json['image']);
  }
}
