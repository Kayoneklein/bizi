import 'package:bizi/redux/actions/home_sceen_actions.dart';
import 'package:bizi/redux/states/home_screen_state.dart';
import 'package:redux/redux.dart';

final homeScreenReducer = combineReducers<HomeScreenState>([
  TypedReducer<HomeScreenState, SetHomeCardDetail>(_setHomeCardDetail).call,
  TypedReducer<HomeScreenState, ChangeMetricFilter>(_changeMetricFilter).call,
]);

HomeScreenState _setHomeCardDetail(
    HomeScreenState state, SetHomeCardDetail action) {
  return state.copyWith(
    isBusinessCard: action.isBusinessCard,
    activeCard: action.activeCard,
  );
}

HomeScreenState _changeMetricFilter(
    HomeScreenState state, ChangeMetricFilter action) {
  return state.copyWith(metricFilterDuration: action.metricFilter);
}
