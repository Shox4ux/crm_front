// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'order_pro_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

OrderProResponse _$OrderProResponseFromJson(Map<String, dynamic> json) =>
    OrderProResponse(
      id: (json['id'] as num).toInt(),
      customQuantity: (json['custom_quantity'] as num).toInt(),
      customPrice: (json['custom_price'] as num).toDouble(),
      warehouseProduct: WareProResponse.fromJson(
        json['warehouse_product'] as Map<String, dynamic>,
      ),
      createdAt: DateTime.parse(json['created_at'] as String),
    );

Map<String, dynamic> _$OrderProResponseToJson(OrderProResponse instance) =>
    <String, dynamic>{
      'id': instance.id,
      'custom_quantity': instance.customQuantity,
      'custom_price': instance.customPrice,
      'warehouse_product': instance.warehouseProduct.toJson(),
      'created_at': instance.createdAt.toIso8601String(),
    };
