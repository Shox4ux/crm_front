// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'client_write.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ClientWrite _$ClientWriteFromJson(Map<String, dynamic> json) => ClientWrite(
  userId: (json['user_id'] as num?)?.toInt(),
  phone: json['phone'] as String?,
  address: json['address'] as String?,
);

Map<String, dynamic> _$ClientWriteToJson(ClientWrite instance) =>
    <String, dynamic>{
      'user_id': ?instance.userId,
      'phone': ?instance.phone,
      'address': ?instance.address,
    };
