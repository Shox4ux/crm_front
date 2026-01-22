// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'order_update.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

OrderUpdate _$OrderUpdateFromJson(Map<String, dynamic> json) => OrderUpdate(
  status: (json['status'] as num).toInt(),
  paidAmount: (json['paid_amount'] as num).toDouble(),
  adminNote: json['admin_note'] as String?,
  clientNote: json['client_note'] as String?,
  deletedOrderProducts: (json['deleted_order_products'] as List<dynamic>?)
      ?.map((e) => (e as num).toInt())
      .toList(),
  updatedOrderProducts: (json['updated_order_products'] as List<dynamic>?)
      ?.map((e) => OrderProUpdate.fromJson(e as Map<String, dynamic>))
      .toList(),
  newOrderProducts: (json['new_order_products'] as List<dynamic>?)
      ?.map((e) => OrderProCreate.fromJson(e as Map<String, dynamic>))
      .toList(),
);

Map<String, dynamic> _$OrderUpdateToJson(OrderUpdate instance) =>
    <String, dynamic>{
      'status': instance.status,
      'paid_amount': instance.paidAmount,
      'deleted_order_products': ?instance.deletedOrderProducts,
      'updated_order_products': ?instance.updatedOrderProducts
          ?.map((e) => e.toJson())
          .toList(),
      'new_order_products': ?instance.newOrderProducts
          ?.map((e) => e.toJson())
          .toList(),
      'admin_note': ?instance.adminNote,
      'client_note': ?instance.clientNote,
    };
