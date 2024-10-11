import 'dart:convert';
import 'dart:developer';

import 'package:dio/dio.dart';

class DioLogInterceptor extends Interceptor {
  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
    log(
      'Request URL: ${options.method} | ${options.uri}',
      name: 'Dio Api Client',
    );
    if (options.headers.isNotEmpty) {
      log('Request Headers: ${options.headers}', name: 'Dio Api Client');
    }
    if (options.queryParameters.isNotEmpty) {
      log(
        'Request Parameters: ${options.queryParameters}',
        name: 'Dio Api Client',
      );
    }
    if (options.data != null) {
      String logString = jsonEncode(options.data);
      if (logString.length > 1001) {
        logString = '${logString.substring(0, 1000)}...';
      }
      log('Request Body: $logString', name: 'Dio Api Client');
    }
    super.onRequest(options, handler);
  }

  @override
  void onResponse(
    Response<dynamic> response,
    ResponseInterceptorHandler handler,
  ) {
    log('Status Code: ${response.statusCode}', name: 'Dio Api Client');
    String logString = jsonEncode(response.data);
    if (logString.length > 2500) {
      logString = '${logString.substring(0, 2400)}...';
    }
    log('Response Body: $logString', name: 'Dio Api Client');
    super.onResponse(response, handler);
  }

  @override
  void onError(dynamic err, ErrorInterceptorHandler handler) {
    log(err.toString(), name: 'Dio Api Client');
    super.onError(err, handler);
  }
}
