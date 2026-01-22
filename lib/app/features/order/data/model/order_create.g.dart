// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'order_create.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

OrderCreate _$OrderCreateFromJson(Map<String, dynamic> json) => OrderCreate(
  clientId: (json['client_id'] as num).toInt(),
  status: (json['status'] as num).toInt(),
  paidAmount: (json['paid_amount'] as num).toDouble(),
  orderProducts: (json['order_products'] as List<dynamic>?)
      ?.map((e) => OrderProCreate.fromJson(e as Map<String, dynamic>))
      .toList(),
  adminNote: json['admin_note'] as String?,
  clientNote: json['client_note'] as String?,
);

Map<String, dynamic> _$OrderCreateToJson(
  OrderCreate instance,
) => <String, dynamic>{
  'client_id': instance.clientId,
  'status': instance.status,
  'paid_amount': instance.paidAmount,
  'order_products': ?instance.orderProducts?.map((e) => e.toJson()).toList(),
  'admin_note': ?instance.adminNote,
  'client_note': ?instance.clientNote,
};
