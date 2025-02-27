import 'package:movie_ticket/features/dashboard/domain/entities/movie_entity.dart';

abstract class MovieRepository {
  Future<List<MovieEntity>> getNowPlayingMovies();
  Future<List<MovieEntity>> getUpComingMovies();
  Future<List<MovieEntity>> getTopRatedMovies();
}
