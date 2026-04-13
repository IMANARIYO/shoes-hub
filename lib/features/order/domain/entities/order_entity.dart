import 'package:shoes_hub_mobile_app/core/enums/order_status.dart';

class OrderEntity {
  final String id;
  final String userId;
  final List<String> itemIds;
  final int totalAmount;
  final OrderStatus status;
  final DateTime createdAt;

  const OrderEntity({
    required this.id,
    required this.userId,
    required this.itemIds,
    required this.totalAmount,
    required this.status,
    required this.createdAt,
  });
}
