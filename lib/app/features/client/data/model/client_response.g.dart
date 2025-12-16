// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'client_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ClientResponse _$ClientResponseFromJson(Map<String, dynamic> json) =>
    ClientResponse(
      id: (json['id'] as num).toInt(),
      user: UserResponse.fromJson(json['user'] as Map<String, dynamic>),
      products: (json['products'] as List<dynamic>?)
          ?.map((e) => ClientProductRead.fromJson(e as Map<String, dynamic>))
          .toList(),
      orders: (json['orders'] as List<dynamic>?)
          ?.map((e) => OrderRead.fromJson(e as Map<String, dynamic>))
          .toList(),
      createdAt: json['created_at'] as String,
    );

Map<String, dynamic> _$ClientResponseToJson(ClientResponse instance) =>
    <String, dynamic>{
      'id': instance.id,
      'user': instance.user.toJson(),
      'products': ?instance.products?.map((e) => e.toJson()).toList(),
      'orders': ?instance.orders?.map((e) => e.toJson()).toList(),
      'created_at': instance.createdAt,
    };
