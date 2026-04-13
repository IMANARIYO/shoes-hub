import '../entities/order_entity.dart';

abstract class OrderRepository {
  Future<List<OrderEntity>> getOrderHistory(String userId);
  Future<OrderEntity> placeOrder(OrderEntity order);
}
