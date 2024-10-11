import 'dart:convert';
import 'dart:io';

import 'package:astronacci/utils/api_client/api_client.dart';
import 'package:astronacci/utils/api_client/dio/dio_error_handler.dart';
import 'package:astronacci/utils/api_client/dio/dio_log_interceptor.dart';
import 'package:astronacci/utils/api_client/dio/exception.dart';
import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';

class DioApiClient implements ApiClient {
  DioApiClient({showDebugLog = kDebugMode}) {
    if (showDebugLog) {
      dio.interceptors.add(DioLogInterceptor());
    }
  }

  final Dio dio = Dio(
    BaseOptions(
      connectTimeout: const Duration(seconds: 60),
      receiveTimeout: const Duration(seconds: 60),
    ),
  );

  final String internetFailure = 'No Internet Connection';

  @override
  Future<dynamic> get(
    String url, {
    Map<String, dynamic>? headers,
    Map<String, dynamic>? queryParams,
  }) async {
    try {
      final response = await dio.get(
        url,
        options: Options(
          headers: headers,
        ),
        queryParameters: queryParams,
      );

      if (response.data is String) {
        try {
          return jsonDecode(response.data);
        } catch (e) {
          //
        }
      }
      return response.data;
    } on SocketException {
      throw ServerException(message: internetFailure);
    } catch (e) {
      throw DioErrorHandler.handleError(e);
    }
  }

  @override
  Future<dynamic> post(
    String url, {
    Map<String, dynamic>? headers,
    Map<String, dynamic>? queryParams,
    Map? body,
  }) async {
    try {
      final response = await dio.post(
        url,
        options: Options(
          headers: headers,
        ),
        queryParameters: queryParams,
        data: body,
      );
      return response.data;
    } on SocketException {
      throw ServerException(message: internetFailure);
    } catch (e) {
      throw DioErrorHandler.handleError(e);
    }
  }

  @override
  Future<Map<String, dynamic>> delete(
    String url, {
    Map<String, dynamic>? headers,
    Map<String, dynamic>? queryParams,
    Map? body,
  }) async {
    try {
      final response = await dio.delete(
        url,
        options: Options(
          headers: headers,
        ),
        queryParameters: queryParams,
        data: body,
      );
      return response.data;
    } on SocketException {
      throw ServerException(message: internetFailure);
    } catch (e) {
      throw DioErrorHandler.handleError(e);
    }
  }
}
