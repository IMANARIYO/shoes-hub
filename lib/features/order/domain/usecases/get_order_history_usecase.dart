import '../entities/order_entity.dart';
import '../repositories/order_repository.dart';

class GetOrderHistoryUseCase {
  final OrderRepository repository;

  GetOrderHistoryUseCase(this.repository);

  Future<List<OrderEntity>> call(String userId) =>
      repository.getOrderHistory(userId);
}
