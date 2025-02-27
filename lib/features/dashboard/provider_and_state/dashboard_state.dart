import 'package:movie_ticket/features/dashboard/data/models/movie_model.dart';

class DashBoardState {
  final MovieModel? movie;

  const DashBoardState({this.movie});

  DashBoardState copyWith({MovieModel? movie}) {
    return DashBoardState(movie: movie ?? this.movie);
  }
}
