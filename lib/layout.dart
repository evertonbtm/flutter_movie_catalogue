import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_catalogue/bloc/movie/movie_cubit.dart';
import 'package:movie_catalogue/widgets/main_pane.dart';
import 'package:movie_catalogue/widgets/subheader/sub_header.dart';
import 'package:movie_catalogue/widgets/leftpane/left_pane_widget.dart';
import 'package:movie_catalogue/widgets/mainheader/main_header.dart';

class AppLayout extends StatefulWidget {
  const AppLayout({super.key});

  @override
  State<StatefulWidget> createState() {
    return _AppLayoutState();
  }
}

class _AppLayoutState extends State<AppLayout> {
  late final MovieCubit cubit;

  @override
  void initState() {
    super.initState();
    cubit = BlocProvider.of<MovieCubit>(context);
    cubit.getMovies(type: 1);
  }

  int currentPage = 1;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        image: DecorationImage(
          image: AssetImage("assets/img/bg.jpg"),
          fit: BoxFit.cover,
        ),
      ),
      child: BackdropFilter(
        filter: ImageFilter.blur(sigmaX: 20.0, sigmaY: 20.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            //left pane
            Container(
              width: 300,
              color: const Color(0xFF253089).withOpacity(0.85),
              child: const LeftPane(),
            ),
            //
            Expanded(
              child: Column(
                children: [
                  //Main Header with search and profile
                  Container(
                    height: 120,
                    color: Colors.indigo.withOpacity(0.80),
                    child: const MainHeader(),
                  ),
                  // Sub header with sort and filter
                  Container(
                    height: 120,
                    color: Colors.deepPurple.withOpacity(0.60),
                    child: const SubHeader(),
                  ),
                  //Main Pane
                  const Expanded(child: Center(child: MainPane())),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
