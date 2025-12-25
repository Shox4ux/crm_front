// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'order_pro_bulk_create.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

OrderProBulkCreate _$OrderProBulkCreateFromJson(Map<String, dynamic> json) =>
    OrderProBulkCreate(
      orderId: (json['order_id'] as num).toInt(),
      items: (json['items'] as List<dynamic>?)
          ?.map((e) => OrderProCreate.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$OrderProBulkCreateToJson(OrderProBulkCreate instance) =>
    <String, dynamic>{
      'order_id': instance.orderId,
      'items': ?instance.items?.map((e) => e.toJson()).toList(),
    };
