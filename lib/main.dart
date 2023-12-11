import 'package:bizi/config.dart';
import 'package:bizi/constants/route_names.dart';
import 'package:bizi/data/global_variables.dart';
import 'package:bizi/redux/states/app_state.dart';
import 'package:bizi/redux/store.dart';
import 'package:bizi/router.dart';
import 'package:bizi/utils/theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:get/get.dart';
import 'package:redux/redux.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  sharedPreferences = await SharedPreferences.getInstance();

  final store = await createStore();
  runApp(MyApp(store: store));
}

class MyApp extends StatelessWidget {
  final Store<AppState> store;
  const MyApp({super.key, required this.store});

  @override
  Widget build(BuildContext context) {
    return StoreProvider(
      store: store,
      child: GetMaterialApp(
        title: AppConfig.appName,
        localizationsDelegates: AppLocalizations.localizationsDelegates,
        locale: store.state.globalAppPropertiesState.locale,
        supportedLocales: AppLocalizations.supportedLocales,
        theme: themeData,
        onGenerateRoute: RouteGenerator.generateRoute,
        initialRoute: RouteName.welcome,
        debugShowCheckedModeBanner: false,
        navigatorKey: navigatorKey,
      ),
    );
  }
}
