import 'package:bizi/redux/actions/user_actions.dart';
import 'package:bizi/redux/states/user_state.dart';
import 'package:redux/redux.dart';

final userReducer = combineReducers<UserState>([
  TypedReducer<UserState, ToggleUserIsLoading>(_toggleIsLoading).call,
  TypedReducer<UserState, SetUser>(_setUser).call,
  TypedReducer<UserState, SetUserErrorMessage>(_setErrorMessage).call,
  TypedReducer<UserState, SetUserSuccessMessage>(_setSuccessMessage).call,
]);

UserState _toggleIsLoading(UserState state, ToggleUserIsLoading action) {
  return state.copyWith(isLoading: action.isLoading);
}

UserState _setUser(UserState state, SetUser action) {
  return state.copyWith(user: action.user);
}

UserState _setErrorMessage(UserState state, SetUserErrorMessage action) {
  return state.copyWith(
      errorMessage: action.message, isLoading: false, successMessage: '');
}

UserState _setSuccessMessage(UserState state, SetUserSuccessMessage action) {
  return state.copyWith(
      successMessage: action.message, isLoading: false, errorMessage: '');
}
