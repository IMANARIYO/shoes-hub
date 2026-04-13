import '../entities/promo_banner_entity.dart';

abstract class HomeRepository {
  Future<List<PromoBannerEntity>> getActivePromoBanners();
}
