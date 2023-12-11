import 'package:bizi/constants/enpoints.dart';
import 'package:bizi/data/global_variables.dart';
import 'package:bizi/models/api_response.dart';
import 'package:bizi/models/user_model.dart';
import 'package:bizi/redux/repositories/user_repository.dart';
import 'package:bizi/service/bizi_http.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'user_repository_tests.mocks.dart';

String? signInG() {
  return 'thisIsARandomUserToken';
}

const String userEmail = 'email@email.com';
const String firstName = 'name';
const String lastName = 'last';

const successAuthRes = ApiResponse(
  status: true,
  body: {
    'token': {
      'accessToken': 'accessToken',
      'refreshToken': 'refreshToken',
    },
    'user': {
      'id': '12',
      'email': userEmail,
      'firstName': firstName,
      'lastName': lastName
    },
  },
);

@GenerateMocks([BiziHttp])
@GenerateMocks([UserRepository])
void main() async {
  late MockBiziHttp biziHttp;

  late UserRepository userRepo;

  setUp(() async {
    SharedPreferences.setMockInitialValues({});
    sharedPreferences = await SharedPreferences.getInstance();
    biziHttp = MockBiziHttp();
    userRepo = UserRepository(biziHttp: biziHttp, authToken: signInG());
  });

  tearDown(() {
    resetMockitoState();
  });

  group('emailSignIn', () {
    String signInUrl = Endpoint.signIn;
    test('returns a successful user model', () async {
      const String userPassword = '1234';

      when(
        biziHttp.postData(
          url: signInUrl,
          body: {
            'password': userPassword,
            'email': userEmail,
          },
          useHeader: false,
        ),
      ).thenAnswer((_) => Future.value(successAuthRes));

      UserModel? userSignIn = await userRepo.emailSignIn(
        password: userPassword,
        email: userEmail,
      );
      verify(biziHttp.postData(
        url: signInUrl,
        body: {
          'password': userPassword,
          'email': userEmail,
        },
        useHeader: false,
      ));

      expect(userSignIn is UserModel, true);
      expect(userSignIn?.email, userEmail);
    });

    test('throw an error when sign-in fails', () async {
      const String userPassword = '1234';
      const String errResponse = 'User already exists';
      const res = ApiResponse(
        status: false,
        body: errResponse,
      );

      when(
        biziHttp.postData(
          url: signInUrl,
          body: {
            'password': userPassword,
            'email': userEmail,
          },
          useHeader: false,
        ),
      ).thenAnswer((_) => Future.value(res));

      UserModel? userSignIn;
      String? expectedResponse;
      try {
        userSignIn = await userRepo.emailSignIn(
          password: userPassword,
          email: userEmail,
        );
        verify(biziHttp.postData(
          url: signInUrl,
          body: {
            'password': userPassword,
            'email': userEmail,
          },
          useHeader: false,
        ));
      } catch (e) {
        expectedResponse = e.toString();
      }

      expect(userSignIn, null);
      expect(expectedResponse, errResponse);
    });
  });

  group('emailSignUp', () {
    String signUpUrl = Endpoint.signUp;

    UserModel newUser = const UserModel(
      email: userEmail,
      firstName: firstName,
      lastName: lastName,
    );
    Map<String, dynamic> json = newUser.toJson();
    json.removeWhere((key, value) => value == null || value == '');

    test('returns a successful user model when sign-up succeeds', () async {
      when(
        biziHttp.postData(
          url: signUpUrl,
          body: json,
          useHeader: false,
        ),
      ).thenAnswer((_) => Future.value(successAuthRes));

      UserModel? userSignIn = await userRepo.emailSignUp(newUser);
      verify(biziHttp.postData(
        url: signUpUrl,
        body: json,
        useHeader: false,
      ));

      expect(userSignIn is UserModel, true);
      expect(userSignIn?.email, userEmail);
    });

    test('throw an error when sign-up fails', () async {
      const String errResponse = 'Incorrect email or password';
      const res = ApiResponse(
        status: false,
        body: errResponse,
      );

      when(
        biziHttp.postData(
          url: signUpUrl,
          body: json,
          useHeader: false,
        ),
      ).thenAnswer((_) => Future.value(res));

      UserModel? userSignIn;
      String? expectedResponse;
      try {
        userSignIn = await userRepo.emailSignUp(newUser);

        verify(biziHttp.postData(
          url: signUpUrl,
          body: json,
          useHeader: false,
        ));
      } catch (e) {
        expectedResponse = e.toString();
      }

      expect(userSignIn, null);
      expect(expectedResponse, errResponse);
    });
  });

  group('googleSignIn', () {
    String url = Endpoint.signInGoogle;
    Map<String, dynamic> body = {'idToken': signInG()};

    test('a successful google sign-in method', () async {
      when(
        biziHttp.postData(
          url: url,
          body: body,
          useHeader: false,
        ),
      ).thenAnswer((_) => Future.value(successAuthRes));
      UserModel? user = await userRepo.googleSignIn();
      verify(biziHttp.postData(
        url: url,
        body: body,
        useHeader: false,
      ));
      expect(user is UserModel, true);
      expect(user?.email, userEmail);
    });

    test('a failed google sign-in method', () async {
      const String errResponse = 'Invalid user token';
      const res = ApiResponse(
        status: false,
        body: errResponse,
      );

      when(
        biziHttp.postData(
          url: url,
          body: body,
          useHeader: false,
        ),
      ).thenAnswer((_) => Future.value(res));
      String? expectedResponse;

      UserModel? user;
      try {
        user = await userRepo.googleSignIn();
      } catch (e) {
        expectedResponse = e.toString();
      }
      verify(biziHttp.postData(
        url: url,
        body: body,
        useHeader: false,
      ));
      expect(user, null);
      expect(expectedResponse, errResponse);
    });
  });
}
