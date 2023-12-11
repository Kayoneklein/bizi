import 'package:bizi/redux/reducers/campaign_builder_reducer.dart';
import 'package:bizi/redux/reducers/global_app_properties_reducer.dart';
import 'package:bizi/redux/reducers/home_screen_reducer.dart';
import 'package:bizi/redux/reducers/user_reducer.dart';
import 'package:bizi/redux/states/app_state.dart';

AppState appReducer(AppState state, action) {
  return AppState(
    campaignBuilderState:
        campaignBuilderReducer(state.campaignBuilderState, action),
    homeScreenState: homeScreenReducer(state.homeScreenState, action),
    globalAppPropertiesState:
        appGlobalReducer(state.globalAppPropertiesState, action),
    userState: userReducer(state.userState, action),
  );
}
