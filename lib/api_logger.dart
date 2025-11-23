import 'dart:convert';

import 'package:dio/dio.dart';

class ApiLogger extends Interceptor {
  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
    print('➡️ [REQUEST]');
    print('URI: ${options.uri}');
    print('Method: ${options.method}');
    print('Headers: ${options.headers}');
    if (options.data != null) {
      try {
        final data = jsonEncode(options.data);
        print('Body: $data');
      } catch (_) {
        print('Body (raw): ${options.data}');
      }
    }
    print('--------------------------------------');
    super.onRequest(options, handler);
  }

  @override
  void onResponse(Response response, ResponseInterceptorHandler handler) {
    print('⬅️ [RESPONSE]');
    print('URI: ${response.requestOptions.uri}');
    print('Status: ${response.statusCode}');
    // print('Data: ${response.data}');
    print('--------------------------------------');
    super.onResponse(response, handler);
  }

  @override
  void onError(DioException err, ErrorInterceptorHandler handler) {
    print('❌ [ERROR]');
    print('URI: ${err.requestOptions.uri}');
    print('Message: ${err.message}');
    if (err.response != null) {
      print('Response: ${err.response?.data}');
    }
    print('--------------------------------------');
    super.onError(err, handler);
  }
}
