// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'warehouse_read.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

WarehouseRead _$WarehouseReadFromJson(Map<String, dynamic> json) =>
    WarehouseRead(
      id: (json['id'] as num).toInt(),
      name: json['name'] as String,
      address: json['address'] as String,
      products: (json['products'] as List<dynamic>?)
          ?.map((e) => WarehouseProductRead.fromJson(e as Map<String, dynamic>))
          .toList(),
      createdAt: DateTime.parse(json['created_at'] as String),
    );

Map<String, dynamic> _$WarehouseReadToJson(WarehouseRead instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'address': instance.address,
      'products': ?instance.products?.map((e) => e.toJson()).toList(),
      'created_at': instance.createdAt.toIso8601String(),
    };
