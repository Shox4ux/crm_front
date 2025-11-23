// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'order_bulk_write.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

OrderProdBulkWrite _$OrderProdBulkWriteFromJson(Map<String, dynamic> json) =>
    OrderProdBulkWrite(
      orderId: (json['order_id'] as num).toInt(),
      items: (json['items'] as List<dynamic>?)
          ?.map((e) => OrderProdWrite.fromJson(e as String))
          .toList(),
    );

Map<String, dynamic> _$OrderProdBulkWriteToJson(OrderProdBulkWrite instance) =>
    <String, dynamic>{
      'order_id': instance.orderId,
      'items': ?instance.items?.map((e) => e.toJson()).toList(),
    };
