// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'auth_write.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AuthWrite _$AuthWriteFromJson(Map<String, dynamic> json) => AuthWrite(
  role: (json['role'] as num).toInt(),
  username: json['username'] as String,
  password: json['password'] as String,
);

Map<String, dynamic> _$AuthWriteToJson(AuthWrite instance) => <String, dynamic>{
  'role': instance.role,
  'username': instance.username,
  'password': instance.password,
};
