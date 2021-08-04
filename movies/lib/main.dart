import 'dart:convert';

import 'package:flutter_redux/flutter_redux.dart';
import 'package:redux/redux.dart';
import 'package:movies/actions/index.dart';
import 'package:movies/container/is_loading_container.dart';
import 'package:movies/container/movies_container.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'package:movies/reducer/reducer.dart';
import 'package:movies/presentation/movie_details.dart';

import 'models/index.dart';

void main() {
  runApp(MoviesApp());
}

class MoviesApp extends StatelessWidget {
  final Store<AppState> store = Store<AppState>(
    reducer,
    initialState: AppState()
  );

  @override
  Widget build(BuildContext context) {
    return StoreProvider<AppState>(
        store: store,
        child: MaterialApp(
      title: 'Movies',
      theme: ThemeData.dark(),
      home: MoviesPage(title: "Movies", store: store),
      routes: <String, WidgetBuilder>{
        '/details': (BuildContext context) => const MovieDetails(),
      }
    )
    );
  }
}

class MoviesPage extends StatefulWidget {
  MoviesPage({Key? key, required this.title, required this.store}) : super(key: key);

  final String title;
  final Store<AppState> store;

  @override
  _MoviesPageState createState() => _MoviesPageState();
}

class _MoviesPageState extends State<MoviesPage> {
  final List<String> _titles = <String>[];
  final List<String> _images = <String>[];
  final List<int> _years = <int>[];
  final List<num> _ratings = <num>[];
  final List<int> _ids = <int>[];

  final ScrollController _controller = ScrollController();

  @override
  void initState() {
    super.initState();
    _getMovies();

    _controller.addListener(() { });
  }

  Future<void> _getMovies() async {
    //https://yts.mx/api/v2/list_movies.json
    final Uri url = Uri(
      scheme: 'https',
      host: 'yts.mx',
      pathSegments: <String>['api', 'v2', 'list_movies.json'],
      queryParameters: <String, String>{
        'limit': '20',
        'page': '1',
      },
    );

    final Response response = await get(url);
    final Map<String, dynamic> body =
        jsonDecode(response.body) as Map<String, dynamic>;
    final Map<String, dynamic> data = body['data'] as Map<String, dynamic>;
    final List<dynamic> movies = data['movies'] as List<dynamic>;

    final List<Movie> _movies = <Movie>[];
    setState(() {
      for (final dynamic movie in movies) {
        final String title = movie['title'] as String;
        final String image = movie['medium_cover_image'] as String;
        final int year = movie['year'] as int;
        final num rating = movie['rating'] as num;
        final int id = movie['id'] as int;
        final String description = movie['description_full'] as String;

        _titles.add(title);
        _images.add(image);
        _years.add(year);
        _ratings.add(rating);
        _ids.add(id);

        final MovieBuilder mb = MovieBuilder();
        mb.id = id;
        mb.image = image;
        mb.title = title;
        mb.largeImage = image;
        mb.description = description;
        _movies.add(mb.build());
      }

      widget.store.dispatch(GetMoviesSuccessful(_movies));
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
        centerTitle: true,
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          GridView.builder(
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              childAspectRatio: 0.7,
            ),
            itemCount: _titles.length,
            scrollDirection: Axis.vertical,
            shrinkWrap: true,
            controller: _controller,
            physics: const AlwaysScrollableScrollPhysics(),
            itemBuilder: (BuildContext context, int index) {
              final String title = _titles[index];
              final String image = _images[index];
              final int year = _years[index];
              final num rating = _ratings[index];
              final int id = _ids[index];

              return GestureDetector(
                onTap: () {
                  StoreProvider.of<AppState>(context)
                    ..dispatch(SetSelectedMovie(id));
                  Navigator.pushNamed(context, '/details');
                },
                child: GridTile(
                  child: Image.network(
                    image,
                    fit: BoxFit.cover,
                  ),
                  footer: GridTileBar(
                    backgroundColor: Colors.black38,
                    title: Text(title),
                    subtitle: Text('$year'),
                    trailing: Stack(
                      alignment: AlignmentDirectional.center,
                      children: <Widget>[
                        const Icon(
                          Icons.star,
                          size: 40.0,
                          color: Colors.amberAccent,
                        ),
                        Text(
                          '$rating',
                          style: const TextStyle(
                            fontSize: 10.0,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                  ),
                )
              );
            },
          ),
        ],
      ),
    );
  }
}
