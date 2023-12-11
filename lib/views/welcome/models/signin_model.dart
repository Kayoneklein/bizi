part of '../index.dart';

class WelcomeModel {
  final bool isLoading;
  final String errorMessage;
  final String successMessage;
  final Function({
    required String firstName,
    required String lastName,
    required String email,
    required String password,
  }) signup;
  final Function({required String email, required String password}) signIn;
  final Function(bool) toggleIsLoading;
  final Function signInWithGoogle;
  final Function signInWithApple;
  final Function(String) forgotPassword;

  const WelcomeModel({
    required this.isLoading,
    required this.signup,
    required this.signIn,
    required this.errorMessage,
    required this.successMessage,
    required this.toggleIsLoading,
    required this.signInWithGoogle,
    required this.signInWithApple,
    required this.forgotPassword,
  });

  static WelcomeModel fromStore(Store<AppState> store) {
    return WelcomeModel(
      isLoading: store.state.userState.isLoading,
      signup: ({
        required String firstName,
        required String lastName,
        required String email,
        required String password,
      }) {
        store.dispatch(EmailSignup(
          password: password,
          email: email,
          firstName: firstName,
          lastName: lastName,
        ));
      },
      signIn: ({required String email, required String password}) {
        store.dispatch(EmailLogin(email: email, password: password));
      },
      toggleIsLoading: (bool loading) =>
          store.dispatch(ToggleUserIsLoading(loading)),
      errorMessage: store.state.userState.errorMessage,
      successMessage: store.state.userState.successMessage,
      signInWithGoogle: () {
        store.dispatch(SignInWithGoogle());
      },
      signInWithApple: () {
        store.dispatch(AppleSignIn());
      },
      forgotPassword: (String email) {
        store.dispatch(ForgotPassword(email));
      },
    );
  }
}
