// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'auth_read.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AuthRead _$AuthReadFromJson(Map<String, dynamic> json) => AuthRead(
  accessToken: json['access_token'] as String,
  tokenType: json['token_type'] as String,
  expiresAt: DateTime.parse(json['expires_at'] as String),
);

Map<String, dynamic> _$AuthReadToJson(AuthRead instance) => <String, dynamic>{
  'access_token': instance.accessToken,
  'token_type': instance.tokenType,
  'expires_at': instance.expiresAt.toIso8601String(),
};
