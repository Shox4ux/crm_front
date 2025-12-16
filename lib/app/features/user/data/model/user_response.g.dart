// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

UserResponse _$UserResponseFromJson(Map<String, dynamic> json) => UserResponse(
  id: (json['id'] as num?)?.toInt(),
  username: json['username'] as String?,
  role: (json['role'] as num?)?.toInt(),
  img: json['img'] as String?,
  phone: json['phone'] as String?,
  isActive: json['is_active'] as bool?,
  address: json['address'] as String?,
  createdAt: json['created_at'] == null
      ? null
      : DateTime.parse(json['created_at'] as String),
);

Map<String, dynamic> _$UserResponseToJson(UserResponse instance) =>
    <String, dynamic>{
      'id': ?instance.id,
      'username': ?instance.username,
      'role': ?instance.role,
      'img': ?instance.img,
      'phone': ?instance.phone,
      'is_active': ?instance.isActive,
      'address': ?instance.address,
      'created_at': ?instance.createdAt?.toIso8601String(),
    };
