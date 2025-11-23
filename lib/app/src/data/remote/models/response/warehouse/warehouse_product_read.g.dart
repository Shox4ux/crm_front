// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'warehouse_product_read.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

WarehouseProductRead _$WarehouseProductReadFromJson(
  Map<String, dynamic> json,
) => WarehouseProductRead(
  id: (json['id'] as num).toInt(),
  warehouseId: (json['warehouse_id'] as num).toInt(),
  product: json['product'] == null
      ? null
      : ProductRead.fromJson(json['product'] as Map<String, dynamic>),
  status: (json['status'] as num).toInt(),
  arrivesAt: json['arrives_at'] == null
      ? null
      : DateTime.parse(json['arrives_at'] as String),
  quantity: (json['quantity'] as num).toInt(),
  createdAt: json['created_at'] == null
      ? null
      : DateTime.parse(json['created_at'] as String),
);

Map<String, dynamic> _$WarehouseProductReadToJson(
  WarehouseProductRead instance,
) => <String, dynamic>{
  'id': instance.id,
  'warehouse_id': instance.warehouseId,
  'product': ?instance.product?.toJson(),
  'status': instance.status,
  'arrives_at': ?instance.arrivesAt?.toIso8601String(),
  'quantity': instance.quantity,
  'created_at': ?instance.createdAt?.toIso8601String(),
};
