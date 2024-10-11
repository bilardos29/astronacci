import 'package:astronacci/utils/api_client/dio/error_body.dart';
import 'package:astronacci/utils/api_client/dio/pagination.dart';

class RawApiResponse {
  RawApiResponse({
    required this.data,
    required this.meta,
    required this.errors,
    required this.notices,
    required this.warnings,
    required this.status,
  });

  factory RawApiResponse.fromJson(Map<String, dynamic> json) => RawApiResponse(
        data: json['data'],
        meta: Meta.fromJson(json['meta']),
        errors: List<ErrorResponse>.from(
          json['errors'].map((x) => ErrorResponse.fromJson(x)),
        ),
        notices: List<dynamic>.from(json['notices'].map((x) => x)),
        warnings: List<dynamic>.from(json['warnings'].map((x) => x)),
        status: json['status'],
      );

  dynamic data;
  Meta meta;
  List<ErrorResponse> errors;
  List<dynamic> notices;
  List<dynamic> warnings;
  String status;
}

class RawResultResponse {
  factory RawResultResponse.fromJson(Map<String, dynamic> json) =>
      RawResultResponse(
        result: json['result'] ?? json['results'],
      );
  RawResultResponse({this.result});

  final dynamic result;
}

class Meta {
  factory Meta.fromJson(Map<String, dynamic> json) => Meta(
        pagination: json['pagination'] == null
            ? null
            : Pagination.fromJson(json['pagination']),
      );

  Meta({
    this.pagination,
  });
  final Pagination? pagination;

  Map<String, dynamic> toJson() => {
        'pagination': pagination?.toJson(),
      };
}
