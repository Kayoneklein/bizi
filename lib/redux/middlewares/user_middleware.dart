import 'package:bizi/constants/route_names.dart';
import 'package:bizi/constants/text_localizations.dart';
import 'package:bizi/models/api_response.dart';
import 'package:bizi/models/user_model.dart';
import 'package:bizi/redux/actions/user_actions.dart';
import 'package:bizi/redux/repositories/user_repository.dart';
import 'package:bizi/redux/states/app_state.dart';
import 'package:bizi/service/bizi_http.dart';
import 'package:get/get.dart';
import 'package:redux/redux.dart';
import 'dart:developer' as dev;
import 'package:http/http.dart' as http;

class UserMiddleware extends MiddlewareClass<AppState> {
  @override
  call(Store<AppState> store, action, NextDispatcher next) async {
    final userRepository = UserRepository(biziHttp: BiziHttp(http.Client()));
    if (action is EmailSignup) {
      try {
        UserModel newUser = UserModel(
          email: action.email,
          firstName: action.firstName,
          lastName: action.lastName,
          password: action.password,
        );
        store.dispatch(const ToggleUserIsLoading(true));
        UserModel? user = await userRepository.emailSignUp(newUser);
        _completeUserAuthSuccess(store, user);
      } catch (e) {
        dev.log('debug error from email signup: $e');
        store.dispatch(SetUserErrorMessage(e.toString()));
      }
    }
    if (action is EmailLogin) {
      try {
        store.dispatch(const ToggleUserIsLoading(true));
        UserModel? user = await userRepository.emailSignIn(
          password: action.password,
          email: action.email,
        );
        _completeUserAuthSuccess(store, user);
      } catch (e) {
        dev.log('debug error from email sign in: $e');
        store.dispatch(SetUserErrorMessage(e.toString()));
      }
    }
    if (action is GetUser) {
      try {
        store.dispatch(const ToggleUserIsLoading(true));
        UserModel? user = await userRepository.getMyData();
        store.dispatch(const ToggleUserIsLoading(false));
        if (user != null) {
          store.dispatch(SetUser(user));
        }
      } catch (e) {
        dev.log('debug error from fetch user data: $e');
        store.dispatch(SetUserErrorMessage(e.toString()));
      }
    }
    if (action is Logout) {}

    if (action is SignInWithGoogle) {
      try {
        store.dispatch(const SetUserErrorMessage(''));
        store.dispatch(const ToggleUserIsLoading(true));
        UserModel? user = await userRepository.googleSignIn();
        _completeUserAuthSuccess(store, user);
      } catch (e) {
        dev.log('debug error from google sign in middleware: $e');
        store.dispatch(SetUserErrorMessage(e.toString()));
      }
    }

    if (action is AppleSignIn) {
      try {
        store.dispatch(const SetUserErrorMessage(''));
        store.dispatch(const ToggleUserIsLoading(true));
        UserModel? user = await userRepository.appleSignIn();
        _completeUserAuthSuccess(store, user);
      } catch (e) {
        dev.log('debug error from google sign in middleware: $e');
        store.dispatch(SetUserErrorMessage(e.toString()));
      }
    }

    if (action is ForgotPassword) {
      try {
        store.dispatch(const ToggleUserIsLoading(true));
        ApiResponse res = await userRepository.forgotPassword(action.email);
        store.dispatch(const ToggleUserIsLoading(false));
        if (res.status) {
          store.dispatch(
            SetUserSuccessMessage(
                TextLocalization.pleaseCheckYourEmailToResetYourPassword),
          );
        } else {
          throw res.body;
        }
      } catch (e) {
        dev.log('$e: error from forgot password middleware');
        store.dispatch(SetUserErrorMessage(e.toString()));
      }
    }

    next(action);
  }

  void _completeUserAuthSuccess(Store<AppState> store, UserModel? user) {
    store.dispatch(const ToggleUserIsLoading(false));
    if (user != null) {
      store.dispatch(SetUser(user));
      store.dispatch(GetUser());
      Get.offAllNamed(RouteName.home);
    } else {
      throw TextLocalization.weCouldNotFetchUserData;
    }
  }
}
