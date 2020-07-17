import 'package:json_annotation/json_annotation.dart';

part 'api_error.g.dart';

@JsonSerializable()
class ApiError {

  final String status;
  final int code;
  final String message;

  ApiError({this.status, this.code, this.message});

  factory ApiError.fromJson(Map<String, dynamic> json) => _$ApiErrorFromJson(json);
}