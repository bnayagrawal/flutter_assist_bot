// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'api_error.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ApiError _$ApiErrorFromJson(Map<String, dynamic> json) {
  return ApiError(
    status: json['status'] as String,
    code: json['code'] as int,
    message: json['message'] as String,
  );
}

Map<String, dynamic> _$ApiErrorToJson(ApiError instance) => <String, dynamic>{
      'status': instance.status,
      'code': instance.code,
      'message': instance.message,
    };
