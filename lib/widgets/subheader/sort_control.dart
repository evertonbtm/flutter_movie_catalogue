import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_catalogue/bloc/movie/movie_cubit.dart';

class SortControl extends StatefulWidget {
  const SortControl({
    super.key,
  });

  @override
  State<SortControl> createState() => _SortControlState();
}

class _SortControlState extends State<SortControl> {
  late final MovieCubit cubit;

  @override
  void initState() {
    super.initState();
    cubit = BlocProvider.of<MovieCubit>(context);
  }

  List<String> list = <String>['Name', 'Genre', 'Year'];
  String orderValue = 'Name';

  @override
  Widget build(BuildContext context) {
    return Flexible(
        child: Row(
      children: [
        const SizedBox(
          width: 100,
        ),
        const Text(
          "Sort by ",
          style: TextStyle(color: Colors.white60, fontSize: 18),
        ),
        const SizedBox(
          width: 20,
        ),
        DropdownButton<String>(
          value: list.first,
          style: const TextStyle(
            color: Colors.white,
          ),
          iconEnabledColor: Colors.white,
          dropdownColor: Colors.deepPurple,
          elevation: 16,
          underline: Container(),
          autofocus: true,
          onChanged: (String? newValue) {
            changedData(newValue);
          },
          items: list.map<DropdownMenuItem<String>>((String value) {
            return DropdownMenuItem<String>(
              onTap: () {},
              value: value,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(value),
              ),
            );
          }).toList(),
        )
      ],
    ));
  }

  void changedData(String? value) {
    setState(() {
      orderValue = value!;
      cubit.sortMovies(orderValue: orderValue);
    });
  }
}
