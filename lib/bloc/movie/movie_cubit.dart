import 'package:bloc/bloc.dart';
import 'package:movie_catalogue/bloc/movie/movie_state.dart';
import 'package:movie_catalogue/models/movie_model.dart';
import 'package:movie_catalogue/repository/movie_repository.dart';

class MovieCubit extends Cubit<MovieState> {
  final _repository = MovieRepository();

  final List<MovieModel> _movies = [];
  int _selectedType = 1;
  ViewType _view = ViewType.grid;

  List<MovieModel> get movies => _movies;
  int get selectedType => _selectedType;
  ViewType get view => _view;

  MovieCubit() : super(MovieInitialState());

  getMovies({required int type, String? filter}) async {
    emit(MovieLoadingState(selectedType: 1));
    _movies.clear();
    filter ??= "";
    List<MovieModel> tempMovies = [];

    if (type == 1) {
      _selectedType = 1;
      emit(MovieLoadingState(selectedType: _selectedType));
      tempMovies = (filter.isNotEmpty
          ? await _repository.filterReleases(filter)
          : await _repository.getReleases());
    } else if (type == 2) {
      _selectedType = 2;
      emit(MovieLoadingState(selectedType: _selectedType));
      tempMovies = (filter.isNotEmpty
          ? await _repository.filterPopular(filter)
          : await _repository.getPopular());
    } else if (type == 3) {
      _selectedType = 3;
      emit(MovieLoadingState(selectedType: selectedType));
      tempMovies = (filter.isNotEmpty
          ? await _repository.filterRecomended(filter)
          : await _repository.getRecomended());
    } else if (type == 4) {
      _selectedType = 4;
      emit(MovieLoadingState(selectedType: _selectedType));
      tempMovies = (filter.isNotEmpty
          ? await _repository.filterTopCharts(filter)
          : await _repository.getTopCharts());
    }

    _movies.addAll(tempMovies);

    emit(MovieLoadedState(movies: tempMovies, selectedType: type, view: _view));
  }

  sortMovies({String? orderValue}) async {
    emit(MovieLoadingState(selectedType: _selectedType));

    switch (orderValue) {
      case "Name":
        _movies.sort((a, b) {
          return a.original_title.compareTo(b.original_title);
        });
      case "Genre":
        _movies.sort((a, b) {
          return a.genre_name.compareTo(b.genre_name);
        });
      case "Year":
        _movies.sort((a, b) {
          return a.release_date.compareTo(b.release_date);
        });
    }

    emit(MovieLoadedState(
        movies: _movies, selectedType: _selectedType, view: _view));
  }

  setViewType(
    ViewType view,
  ) {
    _view = view;
    emit(MovieLoadedState(
        movies: _movies, selectedType: _selectedType, view: _view));
  }
}
