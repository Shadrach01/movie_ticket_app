import 'package:movie_ticket/features/dashboard/domain/entities/movie_entity.dart';
import 'package:movie_ticket/features/dashboard/domain/repositories/movie_repositories.dart';

class GetNowPlayingUseCase {
  final MovieRepository repository;

  const GetNowPlayingUseCase({
    required this.repository,
  });

  Future<List<MovieEntity>> call() {
    return repository.getNowPlayingMovies();
  }
}
