// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'api_error.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$ApiErrorImpl<T> _$$ApiErrorImplFromJson<T>(Map<String, dynamic> json) =>
    _$ApiErrorImpl<T>(
      message: json['status_message'] as String,
      code: json['code'] as int?,
    );

Map<String, dynamic> _$$ApiErrorImplToJson<T>(_$ApiErrorImpl<T> instance) =>
    <String, dynamic>{
      'status_message': instance.message,
      'code': instance.code,
    };
