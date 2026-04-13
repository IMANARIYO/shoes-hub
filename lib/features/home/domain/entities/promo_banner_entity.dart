class PromoBannerEntity {
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

  const PromoBannerEntity({
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
}
