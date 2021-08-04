import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:redux/redux.dart';
import 'package:movies/actions/index.dart';
import 'package:movies/container/selected_movie_container.dart';
import 'package:movies/models/index.dart';

class MovieDetails extends StatelessWidget {
  const MovieDetails({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SelectedMovieContainer(
      builder: (BuildContext context, Movie movie) {
        return Scaffold(
          appBar: AppBar(
            title: Text(movie.title),
          ),
          body: Column(
            children: <Widget>[
              GestureDetector(
                onTap: () {
                  final Store<AppState> store = StoreProvider.of<AppState>(context);
                  final List<Movie> movies = store.state.movies.toList()..shuffle();
                  store //
                    ..dispatch(SetSelectedMovie(movies.first.id));
                },
                child: Image.network(
                  movie.largeImage,
                  width: MediaQuery.of(context).size.width / 2,
                ),
              ),
              Text(movie.description),
            ],
          ),
        );
      },
    );
  }
}
