import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_catalogue/bloc/movie/movie_cubit.dart';
import 'package:movie_catalogue/layout.dart';

void main() {
  runApp(const TheMovieCatalogue());
}

class TheMovieCatalogue extends StatelessWidget {
  const TheMovieCatalogue({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => MovieCubit(),
      child: MaterialApp(
        title: 'The Movie Catalogue',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: const Scaffold(
          body: AppLayout(),
        ),
      ),
    );
  }
}
