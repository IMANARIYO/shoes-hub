import '../entities/promo_banner_entity.dart';
import '../repositories/home_repository.dart';

class GetActivePromoBannersUseCase {
  final HomeRepository repository;

  GetActivePromoBannersUseCase(this.repository);

  Future<List<PromoBannerEntity>> call() => repository.getActivePromoBanners();
}
