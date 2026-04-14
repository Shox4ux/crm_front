// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'admin_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AdminResponse _$AdminResponseFromJson(Map<String, dynamic> json) =>
    AdminResponse(
      id: (json['id'] as num).toInt(),
      permission: (json['permission'] as num).toInt(),
      user: UserResponse.fromJson(json['user'] as Map<String, dynamic>),
      createdAt: DateTime.parse(json['created_at'] as String),
    );

Map<String, dynamic> _$AdminResponseToJson(AdminResponse instance) =>
    <String, dynamic>{
      'id': instance.id,
      'permission': instance.permission,
      'user': instance.user.toJson(),
      'created_at': instance.createdAt.toIso8601String(),
    };
