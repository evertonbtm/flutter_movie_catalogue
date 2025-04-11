import 'package:movie_catalogue/models/movie_model.dart';

abstract class MovieState {
  final List<MovieModel> movies;
  final int selectedType;
  final ViewType? view;

  MovieState({required this.movies, required this.selectedType, this.view});
}

class MovieInitialState extends MovieState {
  MovieInitialState()
      : super(
          movies: [],
          selectedType: 1,
        );
}

class MovieLoadingState extends MovieState {
  MovieLoadingState({
    required super.selectedType,
  }) : super(
          movies: [],
        );
}

class MovieLoadedState extends MovieState {
  MovieLoadedState(
      {required super.movies, required super.selectedType, super.view});
}

class MovieErrorState extends MovieState {
  final String exception;

  MovieErrorState({required this.exception})
      : super(movies: [], selectedType: 1);
}

enum ViewType { grid, list }
