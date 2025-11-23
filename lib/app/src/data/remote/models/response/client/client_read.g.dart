// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'client_read.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ClientRead _$ClientReadFromJson(Map<String, dynamic> json) => ClientRead(
  id: (json['id'] as num).toInt(),
  phone: json['phone'] as String,
  address: json['address'] as String,
  user: UserRead.fromJson(json['user'] as Map<String, dynamic>),
  products: (json['products'] as List<dynamic>?)
      ?.map((e) => ClientProductRead.fromJson(e as Map<String, dynamic>))
      .toList(),
  orders: (json['orders'] as List<dynamic>?)
      ?.map((e) => OrderRead.fromJson(e as Map<String, dynamic>))
      .toList(),
  createdAt: DateTime.parse(json['created_at'] as String),
);

Map<String, dynamic> _$ClientReadToJson(ClientRead instance) =>
    <String, dynamic>{
      'id': instance.id,
      'phone': instance.phone,
      'address': instance.address,
      'user': instance.user.toJson(),
      'products': ?instance.products?.map((e) => e.toJson()).toList(),
      'orders': ?instance.orders?.map((e) => e.toJson()).toList(),
      'created_at': instance.createdAt.toIso8601String(),
    };
