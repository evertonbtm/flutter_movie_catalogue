import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_catalogue/bloc/movie/movie_state.dart';
import 'package:movie_catalogue/widgets/leftpane/main_nav_item.dart';
import 'package:movie_catalogue/widgets/leftpane/sub_nav.dart';

import 'package:movie_catalogue/bloc/movie/movie_cubit.dart';

class LeftPane extends StatefulWidget {
  const LeftPane({super.key});

  @override
  State<LeftPane> createState() => _LeftPaneState();
}

class _LeftPaneState extends State<LeftPane> {
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

          return Column(
            mainAxisSize: MainAxisSize.max,
            children: [
              Container(
                height: 170,
                decoration: const BoxDecoration(
                    border: Border(
                        bottom: BorderSide(color: Colors.white, width: 4)),
                    image: DecorationImage(
                        image: AssetImage("assets/img/logo.png"),
                        fit: BoxFit.cover)),
              ),
              Expanded(
                  child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const SizedBox(
                    height: 50,
                  ),
                  MainNavItem(
                      "New Releases",
                      Icons.rocket_launch_outlined,
                      selectedType == 1,
                      () => cubit.getMovies(
                            type: 1,
                          )),
                  MainNavItem(
                      "Most Popular",
                      Icons.emoji_events_outlined,
                      selectedType == 2,
                      () => cubit.getMovies(
                            type: 2,
                          )),
                  MainNavItem(
                      "Recommended",
                      Icons.verified_outlined,
                      selectedType == 3,
                      () => cubit.getMovies(
                            type: 3,
                          )),
                  MainNavItem(
                      "Top Chart",
                      Icons.diamond_outlined,
                      selectedType == 4,
                      () => cubit.getMovies(
                            type: 4,
                          )),
                ],
              )),
              Expanded(
                  child: Column(children: [
                SubNavItem("My Collection", 20, Icons.stop_circle_rounded,
                    Icons.arrow_drop_down, false, () {}),
                SubNavItem("Bookmark", null, null, null, false, () {}),
                SubNavItem("History", null, null, null, false, () {}),
                SubNavItem("Subscriptions", null, null, null, false, () {}),
              ])),
            ],
          );
        });
  }
}
