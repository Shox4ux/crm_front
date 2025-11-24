// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'warehouse_product_write.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

WarehouseProductWrite _$WarehouseProductWriteFromJson(
  Map<String, dynamic> json,
) => WarehouseProductWrite(
  warehouseId: (json['warehouse_id'] as num).toInt(),
  productId: (json['product_id'] as num).toInt(),
  status: (json['status'] as num).toInt(),
  quantity: (json['quantity'] as num).toInt(),
);

Map<String, dynamic> _$WarehouseProductWriteToJson(
  WarehouseProductWrite instance,
) => <String, dynamic>{
  'warehouse_id': instance.warehouseId,
  'product_id': instance.productId,
  'status': instance.status,
  'quantity': instance.quantity,
};
