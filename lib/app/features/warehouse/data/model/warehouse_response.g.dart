// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'warehouse_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

WarehouseResponse _$WarehouseResponseFromJson(Map<String, dynamic> json) =>
    WarehouseResponse(
      id: (json['id'] as num).toInt(),
      name: json['name'] as String,
      address: json['address'] as String,
      products: (json['products'] as List<dynamic>?)
          ?.map((e) => WareProResponse.fromJson(e as Map<String, dynamic>))
          .toList(),
      createdAt: DateTime.parse(json['created_at'] as String),
    );

Map<String, dynamic> _$WarehouseResponseToJson(WarehouseResponse instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'address': instance.address,
      'products': ?instance.products?.map((e) => e.toJson()).toList(),
      'created_at': instance.createdAt.toIso8601String(),
    };
