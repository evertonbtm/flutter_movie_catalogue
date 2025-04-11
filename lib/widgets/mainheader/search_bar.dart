import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_catalogue/bloc/movie/movie_cubit.dart';
import 'package:movie_catalogue/bloc/movie/movie_state.dart';

class SearchCustomBar extends StatefulWidget {
  const SearchCustomBar({super.key});

  @override
  State<SearchCustomBar> createState() => _SearchCustomBarState();
}

class _SearchCustomBarState extends State<SearchCustomBar> {
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
          int selectedType = 1;

          if (state is MovieState) {
            selectedType = state.selectedType;
          }
          return Flexible(
              child: TextField(
            onChanged: (value) {
              switch (selectedType) {
                case 1:
                  cubit.getMovies(type: 1, filter: value.toLowerCase());
                case 2:
                  cubit.getMovies(type: 2, filter: value.toLowerCase());
                case 3:
                  cubit.getMovies(type: 3, filter: value.toLowerCase());
                case 4:
                  cubit.getMovies(type: 4, filter: value.toLowerCase());
              }
            },
            decoration: const InputDecoration(
              prefixIcon: Padding(
                padding: EdgeInsets.symmetric(horizontal: 30),
                child: Icon(
                  Icons.search,
                  color: Colors.white60,
                  size: 30,
                ),
              ),
              hintText: 'Search By Title, Genre and Year',
              hintStyle: TextStyle(color: Colors.white60, fontSize: 20),
              border: InputBorder.none,
              contentPadding:
                  EdgeInsets.symmetric(horizontal: 20, vertical: 30),
            ),
            cursorColor: Colors.white60,
            style: const TextStyle(
              color: Colors.white60,
              fontSize: 20,
            ),
            cursorHeight: 25,
          ));
        });
  }
}
