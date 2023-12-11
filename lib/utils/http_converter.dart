import 'dart:convert';
import 'dart:developer' as dev;

import 'package:bizi/constants/text_localizations.dart';
import 'package:http/http.dart';

class HTTPConverter {
  static String? convertErrorResponse(dynamic response, bool decode) {
    try {
      dynamic body;
      if (decode == true) {
        body = jsonDecode(response.body);
      } else {
        body = response;
      }
      if (body is String) {
        return body;
      }

      if (body is Map) {
        return _convertMapToString(body);
      }

      if (body is List) {
        return _convertLisToString(body);
      }

      return null;
    } catch (e) {
      return null;
    }
  }

  static dynamic convertSuccessResponse(Response response) {
    try {
      dynamic body = jsonDecode(response.body);
      return body;
    } catch (e) {
      dev.log('$e: error converting successful response');

      /// this usually occurs as a result of some formatting errors or html data;
      return TextLocalization.thisRequestWasSuccessful;
    }
  }

  static String? _convertMapToString(Map res) {
    return convertErrorResponse(res['message'], false);
  }

  static String? _convertLisToString(List res) {
    return convertErrorResponse(res.first, false);
  }
}
