// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'admin_read.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AdminRead _$AdminReadFromJson(Map<String, dynamic> json) => AdminRead(
  id: (json['id'] as num).toInt(),
  userId: (json['user_id'] as num).toInt(),
  permission: (json['permission'] as num).toInt(),
  user: UserRead.fromJson(json['user'] as Map<String, dynamic>),
  createdAt: DateTime.parse(json['created_at'] as String),
);

Map<String, dynamic> _$AdminReadToJson(AdminRead instance) => <String, dynamic>{
  'id': instance.id,
  'user_id': instance.userId,
  'permission': instance.permission,
  'user': instance.user.toJson(),
  'created_at': instance.createdAt.toIso8601String(),
};
