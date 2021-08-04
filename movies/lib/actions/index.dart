library actions;

import 'package:movies/models/index.dart';

part 'get_movies.dart';
part 'set.dart';

abstract class AppAction {}

abstract class ErrorAction implements AppAction {
  Object get error;

  StackTrace get stackTrace;
}

typedef ActionResult = void Function(AppAction action);
