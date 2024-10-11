import 'package:astronacci/utils/api_client/dio/exception.dart';
import 'package:astronacci/utils/api_client/dio/raw_api_response.dart';
import 'package:dio/dio.dart';

class DioErrorHandler {
  static ServerException handleError(dynamic dioError) {
    String message = 'Server Error';
    String? detail = dioError.message;
    if (dioError.toString().contains('SocketException')) {
      message = 'No Internet Connection';
    } else if (dioError is DioException && dioError.response?.data != null) {
      try {
        if (dioError.response?.data.runtimeType != String) {
          final error = RawApiResponse.fromJson(dioError.response?.data)
              .errors
              .firstOrNull;
          message = error?.desc ?? message;
          detail = error?.code;
        } else {
          detail = dioError.response?.data;
        }
      } catch (e) {
        detail = dioError.message;
        // e.toString();
      }
    }
    return ServerException(
      message: (detail == 'CORE.AUTH') ? detail! : message,
      detail: detail,
    );
  }
}
