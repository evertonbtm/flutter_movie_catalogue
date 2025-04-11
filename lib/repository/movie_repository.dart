import 'package:movie_catalogue/models/movie_model.dart';
import 'package:movie_catalogue/data.dart';

class MovieRepository {
  Future<List<MovieModel>> getReleases() async {
    final List<MovieModel> movies = [];

    for (var movie in newReleases) {
      movies.addAll([
        MovieModel(
            adult: (movie["adult"] ?? false),
            backdrop_path: movie["backdrop_path"] ?? "",
            genre_name: getGenre(movie["genre_ids"]),
            id: movie["id"] ?? 0,
            original_language: movie["original_language"] ?? "en",
            original_title: movie["original_title"] ?? "",
            overview: movie["overview"] ?? "",
            popularity: movie["popularity"] ?? 0,
            poster_path: movie["poster_path"] ?? "",
            release_date: movie["release_date"] ?? "1990-312-31",
            title: movie["title"] ?? "",
            video: (movie["video"] ?? false),
            vote_average: (movie["vote_average"] ?? 0),
            vote_count: (movie["vote_count"] ?? 0))
      ]);
    }

    return Future.delayed(
      const Duration(seconds: 0),
      () => movies,
    );
  }

  Future<List<MovieModel>> filterReleases(String? filter) async {
    final List<MovieModel> movies = [];
    final List<MovieModel> getReleases = await this.getReleases();

    String filtering = filter ?? "";

    movies.addAll(getReleases
        .where((movies) =>
            movies.original_title
                .toLowerCase()
                .contains(filtering.toLowerCase()) ||
            movies.release_date
                .toLowerCase()
                .contains(filtering.toLowerCase()) ||
            movies.genre_name.toLowerCase().contains(filtering.toLowerCase()))
        .toList());

    return Future.delayed(
      const Duration(seconds: 0),
      () => movies,
    );
  }

  Future<List<MovieModel>> getRecomended() async {
    final List<MovieModel> movies = [];

    for (var movie in recommended) {
      movies.addAll([
        MovieModel(
            adult: (movie["adult"] ?? false),
            backdrop_path: movie["backdrop_path"] ?? "",
            genre_name: getGenre(movie["genre_ids"]),
            id: movie["id"] ?? 0,
            original_language: movie["original_language"] ?? "en",
            original_title: movie["original_title"] ?? "",
            overview: movie["overview"] ?? "",
            popularity: movie["popularity"] ?? 0,
            poster_path: movie["poster_path"] ?? "",
            release_date: movie["release_date"] ?? "1990-12-31",
            title: movie["title"] ?? "",
            video: (movie["video"] ?? false),
            vote_average: (movie["vote_average"] ?? 0),
            vote_count: (movie["vote_count"] ?? 0))
      ]);
    }

    return Future.delayed(
      const Duration(seconds: 0),
      () => movies,
    );
  }

  Future<List<MovieModel>> filterRecomended(String? filter) async {
    final List<MovieModel> movies = [];
    final List<MovieModel> getRecomended = await this.getRecomended();

    String filtering = filter ?? "";

    movies.addAll(getRecomended
        .where((movies) =>
            movies.original_title
                .toLowerCase()
                .contains(filtering.toLowerCase()) ||
            movies.release_date
                .toLowerCase()
                .contains(filtering.toLowerCase()) ||
            movies.genre_name.toLowerCase().contains(filtering.toLowerCase()))
        .toList());

    return Future.delayed(
      const Duration(seconds: 0),
      () => movies,
    );
  }

  Future<List<MovieModel>> getTopCharts() async {
    final List<MovieModel> movies = [];

    for (var movie in topChart) {
      movies.addAll([
        MovieModel(
            adult: (movie["adult"] ?? false),
            backdrop_path: movie["backdrop_path"] ?? "",
            genre_name: getGenre(movie["genre_ids"]),
            id: movie["id"] ?? 0,
            original_language: movie["original_language"] ?? "en",
            original_title: movie["original_title"] ?? "",
            overview: movie["overview"] ?? "",
            popularity: movie["popularity"] ?? 0,
            poster_path: movie["poster_path"] ?? "",
            release_date: movie["release_date"] ?? "1990-12-31",
            title: movie["title"] ?? "",
            video: (movie["video"] ?? false),
            vote_average: (movie["vote_average"] ?? 0),
            vote_count: (movie["vote_count"] ?? 0))
      ]);
    }

    return Future.delayed(
      const Duration(seconds: 0),
      () => movies,
    );
  }

  Future<List<MovieModel>> filterTopCharts(String? filter) async {
    final List<MovieModel> movies = [];
    final List<MovieModel> getTopCharts = await this.getTopCharts();

    String filtering = filter ?? "";

    movies.addAll(getTopCharts
        .where((movies) =>
            movies.original_title
                .toLowerCase()
                .contains(filtering.toLowerCase()) ||
            movies.release_date
                .toLowerCase()
                .contains(filtering.toLowerCase()) ||
            movies.genre_name.toLowerCase().contains(filtering.toLowerCase()))
        .toList());

    return Future.delayed(
      const Duration(seconds: 0),
      () => movies,
    );
  }

  Future<List<MovieModel>> getPopular() async {
    final List<MovieModel> movies = [];

    for (var movie in mostPopular) {
      movies.addAll([
        MovieModel(
            adult: (movie["adult"] ?? false),
            backdrop_path: movie["backdrop_path"] ?? "",
            genre_name: getGenre(movie["genre_ids"]),
            id: movie["id"] ?? 0,
            original_language: movie["original_language"] ?? "en",
            original_title: movie["original_title"] ?? "",
            overview: movie["overview"] ?? "",
            popularity: movie["popularity"] ?? 0,
            poster_path: movie["poster_path"] ?? "",
            release_date: movie["release_date"] ?? "1990-12-31",
            title: movie["title"] ?? "",
            video: (movie["video"] ?? false),
            vote_average: (movie["vote_average"] ?? 0),
            vote_count: (movie["vote_count"] ?? 0))
      ]);
    }

    return Future.delayed(
      const Duration(seconds: 0),
      () => movies,
    );
  }

  Future<List<MovieModel>> filterPopular(String? filter) async {
    final List<MovieModel> movies = [];
    final List<MovieModel> getPopular = await this.getPopular();

    String filtering = filter ?? "";

    movies.addAll(getPopular
        .where((movies) =>
            movies.original_title
                .toLowerCase()
                .contains(filtering.toLowerCase()) ||
            movies.release_date
                .toLowerCase()
                .contains(filtering.toLowerCase()) ||
            movies.genre_name.toLowerCase().contains(filtering.toLowerCase()))
        .toList());

    return Future.delayed(
      const Duration(seconds: 0),
      () => movies,
    );
  }

  String getGenre(List<int> gIndex) {
    String genre = "";
    gIndex.asMap().forEach((index, value) {
      var g = genres.firstWhere((element) => element["id"] == value,
          orElse: () => {});
      if (index < 2 && g.isNotEmpty) {
        genre += g["name"] + " ";
      }
    });

    return genre;
  }
}
