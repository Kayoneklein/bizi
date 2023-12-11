import 'package:bizi/redux/states/app_state.dart';
import 'package:redux/redux.dart';

class HomeScreenMiddleware extends MiddlewareClass<AppState> {
  @override
  void call(Store<AppState> store, action, NextDispatcher next) {
    next(action);
  }
}
