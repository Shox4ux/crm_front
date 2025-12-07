// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'client_create.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ClientCreate _$ClientCreateFromJson(Map<String, dynamic> json) => ClientCreate(
  userId: (json['user_id'] as num?)?.toInt(),
  phone: json['phone'] as String?,
  address: json['address'] as String?,
);

Map<String, dynamic> _$ClientCreateToJson(ClientCreate instance) =>
    <String, dynamic>{
      'user_id': ?instance.userId,
      'phone': ?instance.phone,
      'address': ?instance.address,
    };
