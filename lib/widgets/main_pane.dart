import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_catalogue/bloc/movie/movie_cubit.dart';
import 'package:movie_catalogue/bloc/movie/movie_state.dart';
import 'package:movie_catalogue/models/movie_model.dart';
import '../data.dart';
import 'package:movie_catalogue/pages/movie_details_page.dart';

class MainPane extends StatefulWidget {
  const MainPane({
    super.key,
  });

  @override
  State<MainPane> createState() => _MainPaneState();
}

class _MainPaneState extends State<MainPane> {
  bool isHover = false;
  late final MovieCubit cubit;

  @override
  void initState() {
    super.initState();
    cubit = BlocProvider.of<MovieCubit>(context);
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder(
        bloc: cubit,
        builder: (context, state) {
          if (state is MovieLoadingState) {
            return const Center(child: CircularProgressIndicator());
          } else if (state is MovieLoadedState) {
            final list = state.movies;
            final view = state.view ?? ViewType.grid;
            return Container(
                margin:
                    const EdgeInsets.symmetric(horizontal: 100, vertical: 20),
                child: GridView.count(
                  crossAxisSpacing: 50,
                  mainAxisSpacing: 20,
                  childAspectRatio: (view == ViewType.grid ? 2.8 / 5 : 5),
                  crossAxisCount: (view == ViewType.grid ? 6 : 1),
                  children:
                      list.map((movie) => getGridItem(view, movie)).toList(),
                ));
          } else {
            return Container();
          }
        });
  }

  GridTile getGridItem(ViewType view, MovieModel movie) {
    return GridTile(
      child: (view == ViewType.grid)
          ? Column(children: [
              Flexible(
                flex: 1,
                fit: FlexFit.loose,
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(10),
                  child: GridTile(
                    footer: Container(
                      alignment: Alignment.centerRight,
                      margin: const EdgeInsets.all(12),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(3),
                        child: Container(
                          padding: const EdgeInsets.symmetric(
                              vertical: 2, horizontal: 3),
                          color: Colors.yellowAccent,
                          child: Text(
                            "\u{2605} ${movie.vote_average}",
                            style: const TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 17,
                                color: Colors.black),
                          ),
                        ),
                      ),
                    ),
                    child: Material(
                      color: Colors.transparent,
                      child: InkWell(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) =>
                                  MovieDetailsPage(movie: movie),
                            ),
                          );
                        },
                        onHover: (val) {
                          setState(() {
                            isHover = val;
                          });
                        },
                        hoverColor: Colors.black,
                        child: CachedNetworkImage(
                          imageUrl: pImageBase + movie.poster_path,
                        ),
                      ),
                    ),
                  ),
                ),
              ),
              Container(
                alignment: Alignment.centerLeft,
                child: Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        movie.original_title,
                        style:
                            const TextStyle(fontSize: 17, color: Colors.white),
                      ),
                      Text(
                        movie.genre_name,
                        style: const TextStyle(
                            fontSize: 15, color: Colors.white60),
                      ),
                    ],
                  ),
                ),
              ),
            ])
          : Card(
              color: Colors.transparent,
              clipBehavior: Clip.antiAlias,
              child: Container(
                height: 120,
                padding: const EdgeInsets.all(0),
                child: Row(children: [
                  Flexible(
                    flex: 1,
                    fit: FlexFit.loose,
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(10),
                      child: GridTile(
                        footer: Container(
                          alignment: Alignment.centerRight,
                          margin: const EdgeInsets.all(12),
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(3),
                            child: Container(
                              padding: const EdgeInsets.symmetric(
                                  vertical: 2, horizontal: 3),
                              color: Colors.yellowAccent,
                              child: Text(
                                "\u{2605} ${movie.vote_average}",
                                style: const TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 17,
                                    color: Colors.black),
                              ),
                            ),
                          ),
                        ),
                        child: Material(
                          color: Colors.transparent,
                          child: InkWell(
                            onTap: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) =>
                                      MovieDetailsPage(movie: movie),
                                ),
                              );
                            },
                            onHover: (val) {
                              setState(() {
                                isHover = val;
                              });
                            },
                            hoverColor: Colors.black,
                            child: CachedNetworkImage(
                              imageUrl: pImageBase + movie.poster_path,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                  Expanded(
                    flex: 6,
                    child: Container(
                      alignment: Alignment.centerLeft,
                      padding: const EdgeInsets.all(10),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: <Widget>[
                          Text(movie.original_title,
                              style: const TextStyle(
                                  fontSize: 20.0,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white)),
                          Wrap(
                            direction: Axis.horizontal, //default
                            alignment: WrapAlignment.start,
                            children: [
                              const Text(
                                "",
                                style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    color: Colors.white60),
                              ),
                              Text(
                                movie.overview,
                                style: const TextStyle(
                                    fontSize: 15.0, color: Colors.white60),
                              ),
                            ],
                          ),
                          Row(
                            children: <Widget>[
                              const Text(
                                'Release : ',
                                style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 15,
                                    color: Colors.white60),
                              ),
                              Text(
                                movie.release_date,
                                style: const TextStyle(
                                    fontSize: 15, color: Colors.white60),
                              )
                            ],
                          ),
                          Row(
                            children: <Widget>[
                              const Text(
                                'Genre : ',
                                style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 15,
                                    color: Colors.white60),
                              ),
                              Text(
                                movie.genre_name,
                                style: const TextStyle(
                                    fontSize: 15, color: Colors.white60),
                              )
                            ],
                          )
                        ],
                      ),
                    ),
                  ),
                ]),
              ),
            ),
    );
  }
}
