class ErrorResponse {
  ErrorResponse({
    required this.code,
    required this.desc,
    this.hint,
    this.args,
  });

  factory ErrorResponse.fromJson(Map<String, dynamic> json) => ErrorResponse(
        code: json['code'],
        desc: json['desc'],
        hint: json['hint'],
        args: json['args'],
      );

  final String code;
  final String desc;
  final dynamic hint;
  final dynamic args;

  Map toJson() => {
        'code': code,
        'desc': desc,
        'hint': hint,
        'args': args,
      };
}
