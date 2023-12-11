import 'package:bizi/redux/actions/global_app_properties_actions.dart';
import 'package:bizi/redux/states/global_app_properties_state.dart';
import 'package:redux/redux.dart';

final appGlobalReducer = combineReducers<GlobalAppPropertiesState>([
  TypedReducer<GlobalAppPropertiesState, ToggleOverlay>(_toggleOverlay).call,
  TypedReducer<GlobalAppPropertiesState, ChangeLocale>(_changeLocale).call,
]);

GlobalAppPropertiesState _toggleOverlay(
    GlobalAppPropertiesState state, ToggleOverlay action) {
  return state.copyWith(overlayActive: action.overlayActive);
}

GlobalAppPropertiesState _changeLocale(
    GlobalAppPropertiesState state, ChangeLocale action) {
  return state.copyWith(locale: action.local);
}
