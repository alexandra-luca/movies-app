part of actions;

class GetMovies {
  const GetMovies();
}

class GetMoviesSuccessful {
  const GetMoviesSuccessful(this.movies) : assert(movies != null);

  final List<Movie> movies;
}

class GetMoviesError {
  const GetMoviesError(this.error);

  final Exception error;
}