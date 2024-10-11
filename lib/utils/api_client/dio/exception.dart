import 'dart:developer';

import 'package:flutter/foundation.dart';

class BaseException implements Exception {
  BaseException({required this.message});

  final String message;
}

class ServerException extends BaseException {
  ServerException({
    required super.message,
    this.detail,
  }) {
    if (kDebugMode) {
      log(
        'ServerException(message: $message, detail: $detail)',
        name: 'Exception',
      );
    }
  }

  final String? detail;
}

class DataException extends BaseException {
  DataException({
    required super.message,
    this.detail,
  }) {
    if (kDebugMode) {
      log(
        'DataException(message: $message, detail: $detail)',
        name: 'Exception',
      );
    }
  }

  final String? detail;
}

class StorageException extends BaseException {
  StorageException({
    required super.message,
    this.detail,
  }) {
    if (kDebugMode) {
      log(
        'StorageException(message: $message, detail: $detail)',
        name: 'Exception',
      );
    }
  }

  final String? detail;
}

class DeviceException extends BaseException {
  DeviceException({
    required super.message,
    this.detail,
  }) {
    if (kDebugMode) {
      log(
        'DeviceException(message: $message, detail: $detail)',
        name: 'Exception',
      );
    }
  }

  final String? detail;
}
