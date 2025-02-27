import 'package:movie_ticket/features/dashboard/domain/entities/movie_entity.dart';
import 'package:movie_ticket/features/dashboard/domain/repositories/movie_repositories.dart';

class GetTopRatedMoviesUseCase {
  final MovieRepository repository;

  const GetTopRatedMoviesUseCase({
    required this.repository,
  });

  Future<List<MovieEntity>> call() {
    return repository.getTopRatedMovies();
  }
}
