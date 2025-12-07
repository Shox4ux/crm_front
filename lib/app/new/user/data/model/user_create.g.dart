// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_create.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

UserCreate _$UserCreateFromJson(Map<String, dynamic> json) => UserCreate(
  username: json['username'] as String?,
  password: json['password'] as String?,
  hashedPassword: json['hashed_password'] as String?,
  role: (json['role'] as num?)?.toInt(),
);

Map<String, dynamic> _$UserCreateToJson(UserCreate instance) =>
    <String, dynamic>{
      'username': ?instance.username,
      'password': ?instance.password,
      'hashed_password': ?instance.hashedPassword,
      'role': ?instance.role,
    };
