// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_write.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

UserWrite _$UserWriteFromJson(Map<String, dynamic> json) => UserWrite(
  username: json['username'] as String,
  password: json['password'] as String,
  hashedPassword: json['hashed_password'] as String?,
  role: (json['role'] as num).toInt(),
);

Map<String, dynamic> _$UserWriteToJson(UserWrite instance) => <String, dynamic>{
  'username': instance.username,
  'password': instance.password,
  'hashed_password': ?instance.hashedPassword,
  'role': instance.role,
};
