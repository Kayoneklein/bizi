import 'dart:convert';
import 'dart:developer' as developer;
import 'package:bizi/constants/text_localizations.dart';
import 'package:bizi/data/global_variables.dart';
import 'package:bizi/models/api_response.dart';
import 'package:bizi/utils/http_converter.dart';
import 'package:http/http.dart' as http;
import 'package:http/http.dart';

class BiziHttp {
  final http.Client client;

  const BiziHttp(this.client);

  Future<ApiResponse> getData({
    required String url,
    bool useHeader = true,
  }) async {
    Uri uri = Uri.parse(url);

    Response res = await client.get(
      uri,
      headers: useHeader ? _getHeader() : null,
    );

    return _processApiData(res);
  }

  Future<ApiResponse> postData({
    required String url,
    required Map<String, dynamic> body,
    bool useHeader = true,
  }) async {
    Uri uri = Uri.parse(url);
    Response res = await client.post(
      uri,
      body: body,
      headers: useHeader ? _getHeader() : null,
    );

    return _processApiData(res);
  }

  static Map<String, String>? _getHeader() {
    String? token = sharedPreferences.getString('token');
    if (token == null) {
      return null;
    }
    Map<String, String> header = {
      // 'Content-Type': 'application/json; charset=UTF-8',
      'Authorization': 'Bearer $token',
    };
    return header;
  }

  static ApiResponse _processApiData(Response response) {
    if (response.statusCode == 200 ||
        response.statusCode == 201 ||
        response.statusCode == 204) {
      try {
        return ApiResponse(
          status: true,
          body: HTTPConverter.convertSuccessResponse(response),
        );
      } catch (e) {
        return ApiResponse(
          status: true,
          body: TextLocalization.thisRequestWasSuccessful,
        );
      }
    }
    developer.log('bizi_http file line 23 - ${response.request?.method} '
        'request on ${response.request?.url}.'
        ' The response gotten is \n - - - - - - -- - - - - - - -- -'
        '- - - - - - - - - - - - - - - - - - \n ${jsonDecode(response.body)}');
    if (response.statusCode == 400) {
      return ApiResponse(
        status: false,
        body: HTTPConverter.convertErrorResponse(response, true) ??
            TextLocalization.somethingWentWrong,
      );
    }
    if (response.statusCode == 401) {
      return ApiResponse(
        status: false,
        body: HTTPConverter.convertErrorResponse(response, true) ??
            TextLocalization.youAreNotAuthenticated,
      );
    }
    if (response.statusCode == 403) {
      return ApiResponse(
        status: false,
        body: HTTPConverter.convertErrorResponse(response, true) ??
            TextLocalization.youDoNotHaveAccessToThisResource,
      );
    }
    if (response.statusCode == 404) {
      return ApiResponse(
        status: false,
        body: HTTPConverter.convertErrorResponse(response, true) ??
            TextLocalization.thisResourceWasNotFound,
      );
    }

    if (response.statusCode == 500) {
      return ApiResponse(
        status: false,
        body: HTTPConverter.convertErrorResponse(response, true) ??
            TextLocalization.aServerErrorOccurred,
      );
    }

    return ApiResponse(
      status: false,
      body: HTTPConverter.convertErrorResponse(response, true) ??
          TextLocalization.anErrorOccurred,
    );
  }
}
