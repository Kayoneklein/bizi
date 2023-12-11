import 'package:bizi/config.dart';

class Endpoint {
  static final String _domain = AppConfig.backendBaseUrl;

  /// Auth routes
  static final String signIn = '$_domain/auth/sign-in';
  static final String signUp = '$_domain/auth/sign-up';
  static final String refresh = '$_domain/auth/refresh';
  static final String forgotPassword = '$_domain/auth/forgot/password';
  static final String signInGoogle = '$_domain/auth/sign-up/google';
  static final String signInApple = '$_domain/auth/sign-in/apple';
  static final String confirmEmail = '$_domain/auth/email/confirm';

  ///User routes
  static final String user = '$_domain/users/me';
}
