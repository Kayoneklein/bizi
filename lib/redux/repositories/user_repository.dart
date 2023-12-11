import 'package:bizi/constants/enpoints.dart';
import 'package:bizi/constants/text_localizations.dart';
import 'package:bizi/data/global_variables.dart';
import 'package:bizi/models/api_response.dart';
import 'package:bizi/models/user_model.dart';
import 'package:bizi/service/bizi_http.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'dart:developer' as dev;

import 'package:sign_in_with_apple/sign_in_with_apple.dart';

class UserRepository {
  final BiziHttp biziHttp;
  final String? authToken;
  const UserRepository({
    required this.biziHttp,
    this.authToken,
  });

  Future<UserModel?> emailSignIn({
    required String password,
    required String email,
  }) async {
    Map<String, dynamic> json = {'password': password, 'email': email};
    return _processAuth(url: Endpoint.signIn, json: json);
  }

  Future<UserModel?> emailSignUp(UserModel user) async {
    Map<String, dynamic> json = user.toJson();
    json.removeWhere((key, value) => value == null || value == '');
    return _processAuth(url: Endpoint.signUp, json: json);
  }

  Future<UserModel?> googleSignIn() async {
    try {
      String? token = authToken ?? await _googleSignIn();

      if (token != null) {
        Map<String, dynamic> json = {'idToken': token};
        return _processAuth(url: Endpoint.signInGoogle, json: json);
      }
      throw TextLocalization.anErrorOccurredWhileSigningYouIn;
    } catch (e) {
      dev.log('$e: error in googleSignIn main repo');
      throw e.toString();
    }
  }

  Future<UserModel?> appleSignIn() async {
    try {
      String? token = await _appleSignIn();
      if (token != null) {
        Map<String, dynamic> json = {'idToken': token};
        return _processAuth(url: Endpoint.signInApple, json: json);
      }
      throw TextLocalization.anErrorOccurredWhileSigningYouIn;
    } catch (e) {
      dev.log('$e: error in apple sign in main repo');
      throw e.toString();
    }
  }

  Future<UserModel?> getMyData() async {
    ApiResponse res = await biziHttp.getData(url: Endpoint.user);
    if (res.status) {
      Map<String, dynamic> json = res.body;
      return UserModel.fromJson(json);
    }
    throw res.body;
  }

  Future<ApiResponse> refreshAuthTokens() async {
    String? refreshToken = sharedPreferences.getString('refreshToken');
    if (refreshToken == null) {
      return ApiResponse(
          status: false, body: TextLocalization.noRefreshTokenFound);
    }

    Map<String, dynamic> json = {'refreshToken': refreshToken};
    ApiResponse res =
        await biziHttp.postData(url: Endpoint.refresh, body: json);
    if (res.status) {
      Map<String, dynamic> token = res.body;
      _setUserTokens(token);
    }

    return res;
  }

  Future<ApiResponse> forgotPassword(String email) async {
    Map<String, dynamic> json = {'email': email};
    try {
      ApiResponse res = await biziHttp.postData(
        url: Endpoint.forgotPassword,
        body: json,
        // useHeader: false, //todo: this should be false because headers are not required at this stage, but there is a backend error from this
      );

      return res;
    } catch (e) {
      return ApiResponse(status: false, body: e.toString());
    }
  }

  /// - - - - - - -- - - - - - - -- - - - - - - - - - - - -- -  -- - - - - - -
  ///  - - - - -- - - - - - - - - - - - - - - - -- - - - - - - - - - - - - - -
  ///   -- - - - - - - - - - - - - - - - - -- - - - - - - -- - - - - - - - - -
  ///   - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - --
  static Future<String?> _googleSignIn() async {
    GoogleSignIn gSignIn = GoogleSignIn(
      scopes: ['email'],
    );
    try {
      GoogleSignInAccount? signIn = await gSignIn.signIn();
      String? token;
      GoogleSignInAuthentication? auth = await signIn?.authentication;
      token = auth?.idToken;
      return token;
    } catch (e) {
      dev.log('$e: error from google sign in repo');
      throw e.toString();
    }
  }

  static Future<String?> _appleSignIn() async {
    try {
      final credential = await SignInWithApple.getAppleIDCredential(
        scopes: [
          AppleIDAuthorizationScopes.email,
          AppleIDAuthorizationScopes.fullName,
        ],
        webAuthenticationOptions: WebAuthenticationOptions(
          clientId: 'io.bizi.bizi',
          redirectUri: Uri(
            scheme: 'https',
            host: 'speakeasy-international.firebaseapp.com',
            path: '__/auth/handler',
          ),
        ),
      );

      // print('credential');
      // print(credential.authorizationCode);
      // print(credential.identityToken);
      return credential.authorizationCode;
    } catch (e) {
      // print('e');
      dev.log('$e: error from appple login private repo');
      throw TextLocalization.appleSignInFailed;
    }
  }

  Future<UserModel?> _processAuth({
    required String url,
    required Map<String, dynamic> json,
  }) async {
    ApiResponse res =
        await biziHttp.postData(url: url, body: json, useHeader: false);

    if (res.status) {
      Map<String, dynamic> json = res.body['user'];
      Map<String, dynamic> token = res.body['token'];
      _setUserTokens(token);
      return UserModel.fromJson(json);
    }
    throw res.body;
  }

  static _setUserTokens(Map<String, dynamic> token) {
    sharedPreferences.setString('token', token['accessToken']);
    sharedPreferences.setString('refreshToken', token['refreshToken']);
  }
}
