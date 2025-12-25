// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'ware_pro_create.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

WareProCreate _$WareProCreateFromJson(Map<String, dynamic> json) =>
    WareProCreate(
      warehouseId: (json['warehouse_id'] as num).toInt(),
      productId: (json['product_id'] as num).toInt(),
      status: (json['status'] as num).toInt(),
      quantity: (json['quantity'] as num).toInt(),
    );

Map<String, dynamic> _$WareProCreateToJson(WareProCreate instance) =>
    <String, dynamic>{
      'warehouse_id': instance.warehouseId,
      'product_id': instance.productId,
      'status': instance.status,
      'quantity': instance.quantity,
    };
