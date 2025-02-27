import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:movie_ticket/core/utils/api_constants.dart';
import 'package:movie_ticket/features/dashboard/data/datasources/movie_remote_data_source.dart';
import 'package:movie_ticket/features/dashboard/data/repositories/movie_repo_impl.dart';
import 'package:movie_ticket/features/dashboard/domain/entities/movie_entity.dart';
import 'package:movie_ticket/features/dashboard/domain/repositories/movie_repositories.dart';
import 'package:movie_ticket/features/dashboard/domain/usecases/get_top_rated_movies_use_case.dart';
import 'package:movie_ticket/features/dashboard/domain/usecases/get_up_coming_movies_use_case.dart';
import 'package:movie_ticket/features/dashboard/domain/usecases/now_playing_use_case.dart';
import 'package:http/http.dart' as http;

final httpClientProvider = Provider<http.Client>((ref) => http.Client());

final apiKeyProvider = Provider<String>((ref) => ApiConstants.apiKey);

final movieRemoteDataSourceProvider = Provider<MovieRemoteDataSource>(
  (ref) {
    final client = ref.watch(httpClientProvider);
    final apiKey = ref.watch(apiKeyProvider);
    return MovieRemoteDataSource(client: client, apiKey: apiKey);
  },
);

final movieRepositoryProvider = Provider<MovieRepository>((ref) {
  final remoteDataSource = ref.watch(movieRemoteDataSourceProvider);
  return MovieRepoImpl(remoteDataSource: remoteDataSource);
});

final nowPlayingMoviesProvider = FutureProvider<List<MovieEntity>>((ref) {
  final repository = ref.watch(movieRepositoryProvider);
  final useCase = GetNowPlayingUseCase(repository: repository);
  return useCase.call();
});

final upComingMoviesProvider = FutureProvider<List<MovieEntity>>((ref) {
  final repo = ref.watch(movieRepositoryProvider);
  final useCase = GetUpComingMoviesUseCase(repository: repo);
  return useCase.call();
});

final topRatedMoviesProvider = FutureProvider<List<MovieEntity>>((ref) {
  final repository = ref.watch(movieRepositoryProvider);
  final useCase = GetTopRatedMoviesUseCase(repository: repository);
  return useCase.call();
});
