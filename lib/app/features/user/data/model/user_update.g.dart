// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_update.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

UserUpdate _$UserUpdateFromJson(Map<String, dynamic> json) => UserUpdate(
  isActive: json['is_active'] as bool?,
  password: json['password'] as String?,
  hashedPassword: json['hashed_password'] as String?,
);

Map<String, dynamic> _$UserUpdateToJson(UserUpdate instance) =>
    <String, dynamic>{
      'is_active': ?instance.isActive,
      'password': ?instance.password,
      'hashed_password': ?instance.hashedPassword,
    };
