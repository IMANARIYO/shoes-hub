class PromoBanner {
  final String id;
  final String title;
  final String subtitle;
  final String imageUrl;
  final String targetType;
  final String targetValue;
  final int position;
  final bool active;
  final DateTime? startDate;
  final DateTime? endDate;

  const PromoBanner({
    required this.id,
    required this.title,
    required this.subtitle,
    required this.imageUrl,
    required this.targetType,
    required this.targetValue,
    required this.position,
    required this.active,
    this.startDate,
    this.endDate,
  });

  factory PromoBanner.fromMap(Map<String, dynamic> map) {
    return PromoBanner(
      id: map['id'] as String,
      title: map['title'] as String,
      subtitle: map['subtitle'] as String,
      imageUrl: map['imageUrl'] as String,
      targetType: map['targetType'] as String,
      targetValue: map['targetValue'] as String,
      position: map['position'] as int,
      active: map['active'] as bool,
      startDate: map['startDate'] != null ? DateTime.parse(map['startDate'] as String) : null,
      endDate: map['endDate'] != null ? DateTime.parse(map['endDate'] as String) : null,
    );
  }
}
