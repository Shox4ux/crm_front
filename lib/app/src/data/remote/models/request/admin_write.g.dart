// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'admin_write.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AdminRequestModel _$AdminRequestModelFromJson(Map<String, dynamic> json) =>
    AdminRequestModel(
      userId: (json['user_id'] as num).toInt(),
      permission: (json['permission'] as num).toInt(),
    );

Map<String, dynamic> _$AdminRequestModelToJson(AdminRequestModel instance) =>
    <String, dynamic>{
      'user_id': instance.userId,
      'permission': instance.permission,
    };
