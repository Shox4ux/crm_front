// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'order_pro_create.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

OrderProCreate _$OrderProCreateFromJson(Map<String, dynamic> json) =>
    OrderProCreate(
      customPrice: json['custom_price'] as num,
      customQuantity: json['custom_quantity'] as num,
      warehouseProductId: (json['warehouse_product_id'] as num).toInt(),
    );

Map<String, dynamic> _$OrderProCreateToJson(OrderProCreate instance) =>
    <String, dynamic>{
      'custom_price': instance.customPrice,
      'custom_quantity': instance.customQuantity,
      'warehouse_product_id': instance.warehouseProductId,
    };
