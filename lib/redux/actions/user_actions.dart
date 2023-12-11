import 'package:bizi/models/user_model.dart';

class ToggleUserIsLoading {
  final bool isLoading;

  const ToggleUserIsLoading(this.isLoading);
}

class SetUserErrorMessage {
  final String message;

  const SetUserErrorMessage(this.message);
}

class SetUserSuccessMessage {
  final String message;

  const SetUserSuccessMessage(this.message);
}

class EmailSignup {
  final String firstName;
  final String lastName;
  final String email;
  final String password;

  const EmailSignup({
    required this.password,
    required this.email,
    required this.firstName,
    required this.lastName,
  });
}

class EmailLogin {
  final String email;
  final String password;

  const EmailLogin({required this.email, required this.password});
}

class Logout {}

class GetUser {}

class SetUser {
  final UserModel user;

  const SetUser(this.user);
}

class SignInWithGoogle {}

class AppleSignIn {}

class ForgotPassword {
  final String email;

  const ForgotPassword(this.email);
}
