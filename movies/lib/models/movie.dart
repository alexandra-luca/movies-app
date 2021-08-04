part of models;

abstract class Movie implements Built<Movie, MovieBuilder> {
  factory Movie([void Function(MovieBuilder) updates]) = _$Movie;

  factory Movie.fromJson(dynamic json) {
    return serializers.deserializeWith(serializer, json) as Movie;
  }

  Movie._();

  int get id;

  String get title;

  @BuiltValueField(wireName: 'medium_cover_image')
  String get image;

  @BuiltValueField(wireName: 'large_cover_image')
  String get largeImage;

  String get description;

  static Serializer<Movie> get serializer => _$movieSerializer;
}
