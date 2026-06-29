import 'package:estatelqapp/features/home_favorite_feature/data/repositories/favorite_repository.dart';

class AddToFavoriteUseCase {
  final FavoriteRepository repository;

  AddToFavoriteUseCase(this.repository);

  Future<void> execute(String propertyId) async {
    await repository.addToFavorite(propertyId);
  }
}
