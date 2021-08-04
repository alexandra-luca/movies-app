import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:movies/models/index.dart';
import 'package:redux/redux.dart';

class SelectedMovieContainer extends StatelessWidget {
  const SelectedMovieContainer({Key? key, required this.builder}) : super(key: key);

  final ViewModelBuilder<Movie> builder;

  @override
  Widget build(BuildContext context) {
    return StoreConnector<AppState, Movie>(
      converter: (Store<AppState> store) {
        return store.state.movies.firstWhere((Movie item) => item.id == store.state.selectedMovie);
      },
      builder: builder,
    );
  }
}
