import 'package:movie_ticket/features/dashboard/data/datasources/movie_remote_data_source.dart';
import 'package:movie_ticket/features/dashboard/domain/entities/movie_entity.dart';
import 'package:movie_ticket/features/dashboard/domain/repositories/movie_repositories.dart';

class MovieRepoImpl implements MovieRepository {
  final MovieRemoteDataSource remoteDataSource;

  const MovieRepoImpl({required this.remoteDataSource});

  @override
  Future<List<MovieEntity>> getNowPlayingMovies() async {
    final movieModels = await remoteDataSource.getNowPlayingMovies();
    return movieModels.map((model) => model.toEntity()).toList();
  }

  @override
  Future<List<MovieEntity>> getTopRatedMovies() async {
    final movieModels = await remoteDataSource.getTopRatedMovies();
    return movieModels.map((model) => model.toEntity()).toList();
  }

  @override
  Future<List<MovieEntity>> getUpComingMovies() async {
    final movieModels = await remoteDataSource.getUpComingMovies();
    return movieModels.map((model) => model.toEntity()).toList();
  }
}
