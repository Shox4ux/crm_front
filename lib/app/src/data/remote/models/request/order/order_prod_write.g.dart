// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'order_prod_write.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

OrderProdWrite _$OrderProdWriteFromJson(Map<String, dynamic> json) =>
    OrderProdWrite(
      customPrice: json['custom_price'] as num,
      customQuantity: json['custom_quantity'] as num,
      warehouseProductId: (json['warehouse_product_id'] as num).toInt(),
    );

Map<String, dynamic> _$OrderProdWriteToJson(OrderProdWrite instance) =>
    <String, dynamic>{
      'custom_price': instance.customPrice,
      'custom_quantity': instance.customQuantity,
      'warehouse_product_id': instance.warehouseProductId,
    };
