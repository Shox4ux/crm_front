// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_read.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

UserRead _$UserReadFromJson(Map<String, dynamic> json) => UserRead(
  id: (json['id'] as num).toInt(),
  username: json['username'] as String,
  password: json['password'] as String,
  role: (json['role'] as num).toInt(),
  createdAt: DateTime.parse(json['created_at'] as String),
);

Map<String, dynamic> _$UserReadToJson(UserRead instance) => <String, dynamic>{
  'id': instance.id,
  'username': instance.username,
  'password': instance.password,
  'role': instance.role,
  'created_at': instance.createdAt.toIso8601String(),
};
