import 'package:bizi/redux/middlewares/campaign_builder_middleware.dart';
import 'package:bizi/redux/middlewares/home_screen_middleware.dart';
import 'package:bizi/redux/middlewares/user_middleware.dart';
import 'package:bizi/redux/reducers/app_reducer.dart';
import 'package:bizi/redux/states/app_state.dart';
import 'package:redux/redux.dart';
import 'package:redux_persist/redux_persist.dart';
import 'package:redux_persist_flutter/redux_persist_flutter.dart';

Future<Store<AppState>> createStore() async {
  final persistor = Persistor(
    storage: FlutterStorage(),
    serializer: JsonSerializer<AppState>(AppState.fromJson),
    debug: false,
  );

  dynamic initialState;
  try {
    initialState = await persistor.load();
  } catch (e) {
    initialState = null;
  }

  return Store(
    appReducer,
    initialState: initialState ?? AppState.initial(),
    middleware: [
      persistor.createMiddleware(),
      CampaignBuilderMiddleware().call,
      HomeScreenMiddleware().call,
      UserMiddleware().call,
    ],
  );
}
