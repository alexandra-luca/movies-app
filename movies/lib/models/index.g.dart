// GENERATED CODE - DO NOT MODIFY BY HAND

part of models;

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<AppState> _$appStateSerializer = new _$AppStateSerializer();
Serializer<Movie> _$movieSerializer = new _$MovieSerializer();

class _$AppStateSerializer implements StructuredSerializer<AppState> {
  @override
  final Iterable<Type> types = const [AppState, _$AppState];
  @override
  final String wireName = 'AppState';

  @override
  Iterable<Object?> serialize(Serializers serializers, AppState object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[
      'movies',
      serializers.serialize(object.movies,
          specifiedType:
              const FullType(BuiltList, const [const FullType(Movie)])),
      'isLoading',
      serializers.serialize(object.isLoading,
          specifiedType: const FullType(bool)),
      'page',
      serializers.serialize(object.page, specifiedType: const FullType(int)),
    ];
    Object? value;
    value = object.error;
    if (value != null) {
      result
        ..add('error')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.selectedMovie;
    if (value != null) {
      result
        ..add('selectedMovie')
        ..add(serializers.serialize(value, specifiedType: const FullType(int)));
    }
    return result;
  }

  @override
  AppState deserialize(Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new AppStateBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current as String;
      iterator.moveNext();
      final Object? value = iterator.current;
      switch (key) {
        case 'movies':
          result.movies.replace(serializers.deserialize(value,
                  specifiedType:
                      const FullType(BuiltList, const [const FullType(Movie)]))!
              as BuiltList<Object?>);
          break;
        case 'isLoading':
          result.isLoading = serializers.deserialize(value,
              specifiedType: const FullType(bool)) as bool;
          break;
        case 'error':
          result.error = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'page':
          result.page = serializers.deserialize(value,
              specifiedType: const FullType(int)) as int;
          break;
        case 'selectedMovie':
          result.selectedMovie = serializers.deserialize(value,
              specifiedType: const FullType(int)) as int?;
          break;
      }
    }

    return result.build();
  }
}

class _$MovieSerializer implements StructuredSerializer<Movie> {
  @override
  final Iterable<Type> types = const [Movie, _$Movie];
  @override
  final String wireName = 'Movie';

  @override
  Iterable<Object?> serialize(Serializers serializers, Movie object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[
      'id',
      serializers.serialize(object.id, specifiedType: const FullType(int)),
      'title',
      serializers.serialize(object.title,
          specifiedType: const FullType(String)),
      'medium_cover_image',
      serializers.serialize(object.image,
          specifiedType: const FullType(String)),
      'large_cover_image',
      serializers.serialize(object.largeImage,
          specifiedType: const FullType(String)),
      'description',
      serializers.serialize(object.description,
          specifiedType: const FullType(String)),
    ];

    return result;
  }

  @override
  Movie deserialize(Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new MovieBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current as String;
      iterator.moveNext();
      final Object? value = iterator.current;
      switch (key) {
        case 'id':
          result.id = serializers.deserialize(value,
              specifiedType: const FullType(int)) as int;
          break;
        case 'title':
          result.title = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'medium_cover_image':
          result.image = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'large_cover_image':
          result.largeImage = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'description':
          result.description = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
      }
    }

    return result.build();
  }
}

class _$AppState extends AppState {
  @override
  final BuiltList<Movie> movies;
  @override
  final bool isLoading;
  @override
  final String? error;
  @override
  final int page;
  @override
  final int? selectedMovie;

  factory _$AppState([void Function(AppStateBuilder)? updates]) =>
      (new AppStateBuilder()..update(updates)).build();

  _$AppState._(
      {required this.movies,
      required this.isLoading,
      this.error,
      required this.page,
      this.selectedMovie})
      : super._() {
    BuiltValueNullFieldError.checkNotNull(movies, 'AppState', 'movies');
    BuiltValueNullFieldError.checkNotNull(isLoading, 'AppState', 'isLoading');
    BuiltValueNullFieldError.checkNotNull(page, 'AppState', 'page');
  }

  @override
  AppState rebuild(void Function(AppStateBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  AppStateBuilder toBuilder() => new AppStateBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is AppState &&
        movies == other.movies &&
        isLoading == other.isLoading &&
        error == other.error &&
        page == other.page &&
        selectedMovie == other.selectedMovie;
  }

  @override
  int get hashCode {
    return $jf($jc(
        $jc(
            $jc($jc($jc(0, movies.hashCode), isLoading.hashCode),
                error.hashCode),
            page.hashCode),
        selectedMovie.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper('AppState')
          ..add('movies', movies)
          ..add('isLoading', isLoading)
          ..add('error', error)
          ..add('page', page)
          ..add('selectedMovie', selectedMovie))
        .toString();
  }
}

class AppStateBuilder implements Builder<AppState, AppStateBuilder> {
  _$AppState? _$v;

  ListBuilder<Movie>? _movies;
  ListBuilder<Movie> get movies => _$this._movies ??= new ListBuilder<Movie>();
  set movies(ListBuilder<Movie>? movies) => _$this._movies = movies;

  bool? _isLoading;
  bool? get isLoading => _$this._isLoading;
  set isLoading(bool? isLoading) => _$this._isLoading = isLoading;

  String? _error;
  String? get error => _$this._error;
  set error(String? error) => _$this._error = error;

  int? _page;
  int? get page => _$this._page;
  set page(int? page) => _$this._page = page;

  int? _selectedMovie;
  int? get selectedMovie => _$this._selectedMovie;
  set selectedMovie(int? selectedMovie) =>
      _$this._selectedMovie = selectedMovie;

  AppStateBuilder();

  AppStateBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _movies = $v.movies.toBuilder();
      _isLoading = $v.isLoading;
      _error = $v.error;
      _page = $v.page;
      _selectedMovie = $v.selectedMovie;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(AppState other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$AppState;
  }

  @override
  void update(void Function(AppStateBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  _$AppState build() {
    _$AppState _$result;
    try {
      _$result = _$v ??
          new _$AppState._(
              movies: movies.build(),
              isLoading: BuiltValueNullFieldError.checkNotNull(
                  isLoading, 'AppState', 'isLoading'),
              error: error,
              page: BuiltValueNullFieldError.checkNotNull(
                  page, 'AppState', 'page'),
              selectedMovie: selectedMovie);
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'movies';
        movies.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            'AppState', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

class _$Movie extends Movie {
  @override
  final int id;
  @override
  final String title;
  @override
  final String image;
  @override
  final String largeImage;
  @override
  final String description;

  factory _$Movie([void Function(MovieBuilder)? updates]) =>
      (new MovieBuilder()..update(updates)).build();

  _$Movie._(
      {required this.id,
      required this.title,
      required this.image,
      required this.largeImage,
      required this.description})
      : super._() {
    BuiltValueNullFieldError.checkNotNull(id, 'Movie', 'id');
    BuiltValueNullFieldError.checkNotNull(title, 'Movie', 'title');
    BuiltValueNullFieldError.checkNotNull(image, 'Movie', 'image');
    BuiltValueNullFieldError.checkNotNull(largeImage, 'Movie', 'largeImage');
    BuiltValueNullFieldError.checkNotNull(description, 'Movie', 'description');
  }

  @override
  Movie rebuild(void Function(MovieBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  MovieBuilder toBuilder() => new MovieBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is Movie &&
        id == other.id &&
        title == other.title &&
        image == other.image &&
        largeImage == other.largeImage &&
        description == other.description;
  }

  @override
  int get hashCode {
    return $jf($jc(
        $jc($jc($jc($jc(0, id.hashCode), title.hashCode), image.hashCode),
            largeImage.hashCode),
        description.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper('Movie')
          ..add('id', id)
          ..add('title', title)
          ..add('image', image)
          ..add('largeImage', largeImage)
          ..add('description', description))
        .toString();
  }
}

class MovieBuilder implements Builder<Movie, MovieBuilder> {
  _$Movie? _$v;

  int? _id;
  int? get id => _$this._id;
  set id(int? id) => _$this._id = id;

  String? _title;
  String? get title => _$this._title;
  set title(String? title) => _$this._title = title;

  String? _image;
  String? get image => _$this._image;
  set image(String? image) => _$this._image = image;

  String? _largeImage;
  String? get largeImage => _$this._largeImage;
  set largeImage(String? largeImage) => _$this._largeImage = largeImage;

  String? _description;
  String? get description => _$this._description;
  set description(String? description) => _$this._description = description;

  MovieBuilder();

  MovieBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _id = $v.id;
      _title = $v.title;
      _image = $v.image;
      _largeImage = $v.largeImage;
      _description = $v.description;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(Movie other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$Movie;
  }

  @override
  void update(void Function(MovieBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  _$Movie build() {
    final _$result = _$v ??
        new _$Movie._(
            id: BuiltValueNullFieldError.checkNotNull(id, 'Movie', 'id'),
            title:
                BuiltValueNullFieldError.checkNotNull(title, 'Movie', 'title'),
            image:
                BuiltValueNullFieldError.checkNotNull(image, 'Movie', 'image'),
            largeImage: BuiltValueNullFieldError.checkNotNull(
                largeImage, 'Movie', 'largeImage'),
            description: BuiltValueNullFieldError.checkNotNull(
                description, 'Movie', 'description'));
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,deprecated_member_use_from_same_package,lines_longer_than_80_chars,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new
