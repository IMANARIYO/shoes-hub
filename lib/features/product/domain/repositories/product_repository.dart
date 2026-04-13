import '../entities/product_entity.dart';
import '../entities/category_entity.dart';

// Abstract contract — implemented in data layer
abstract class ProductRepository {
  Future<List<ProductEntity>> getProducts();
  Future<List<CategoryEntity>> getCategories();
  Future<ProductEntity> getProductById(int id);
}
