import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_catalogue/bloc/movie/movie_cubit.dart';
import 'package:movie_catalogue/bloc/movie/movie_state.dart';

class ViewControls extends StatefulWidget {
  const ViewControls({
    super.key,
  });

  @override
  State<ViewControls> createState() => _ViewControlsState();
}

class _ViewControlsState extends State<ViewControls> {
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
          return Row(
            children: [
              Material(
                color: Colors.transparent,
                child: InkWell(
                  onTap: () => setState(() {
                    cubit.setViewType(
                      ViewType.list,
                    );
                  }),
                  onHover: (val) {},
                  hoverColor: Colors.deepPurple,
                  child: const Icon(
                    Icons.view_list,
                    size: 35,
                    color: Colors.white,
                  ),
                ),
              ),
              const SizedBox(
                width: 20,
              ),
              Material(
                color: Colors.transparent,
                child: InkWell(
                  onTap: () {
                    setState(() {
                      cubit.setViewType(
                        ViewType.grid,
                      );
                    });
                  },
                  onHover: (val) {},
                  hoverColor: Colors.deepPurple,
                  child: const Icon(
                    Icons.view_module,
                    size: 35,
                    color: Colors.white,
                  ),
                ),
              ),
              const SizedBox(
                width: 100,
              )
            ],
          );
        });
  }
}
