import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:movie_ticket/core/utils/api_constants.dart';
import 'package:movie_ticket/features/dashboard/data/models/movie_model.dart';

class MovieRemoteDataSource {
  final http.Client client;
  final String apiKey;
  final String baseUrl = ApiConstants.baseUrl;

  MovieRemoteDataSource({required this.client, required this.apiKey});

  Future<List<MovieModel>> getNowPlayingMovies() async {
    final response = await client.get(
      Uri.parse('$baseUrl/movie/now_playing?api_key=$apiKey'),
    );

    if (response.statusCode == 200) {
      final Map<String, dynamic> data = json.decode(response.body);
      return (data['results'] as List)
          .map((movie) => MovieModel.fromJson(movie))
          .toList();
    } else {
      throw Exception('Failed to load now playing movies');
    }
  }

  Future<List<MovieModel>> getUpComingMovies() async {
    final response = await client.get(
      Uri.parse('$baseUrl/movie/upcoming?api_key=$apiKey'),
    );

    if (response.statusCode == 200) {
      final Map<String, dynamic> data = json.decode(response.body);
      return (data['results'] as List)
          .map((movie) => MovieModel.fromJson(movie))
          .toList();
    } else {
      throw Exception('Failed to load upcoming movies');
    }
  }

  Future<List<MovieModel>> getTopRatedMovies() async {
    final response = await client.get(
      Uri.parse('$baseUrl/movie/top_rated?api_key=$apiKey'),
    );

    if (response.statusCode == 200) {
      final Map<String, dynamic> data = json.decode(response.body);
      return (data['results'] as List)
          .map((movie) => MovieModel.fromJson(movie))
          .toList();
    } else {
      throw Exception('Failed to load top rated movies');
    }
  }
}
