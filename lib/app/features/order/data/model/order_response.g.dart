// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'order_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

OrderResponse _$OrderResponseFromJson(Map<String, dynamic> json) =>
    OrderResponse(
      id: (json['id'] as num).toInt(),
      status: (json['status'] as num).toInt(),
      paidAmount: (json['paid_amount'] as num).toDouble(),
      adminNote: json['admin_note'] as String?,
      clientNote: json['client_note'] as String?,
      createdAt: DateTime.parse(json['created_at'] as String),
      orderProducts: (json['order_products'] as List<dynamic>?)
          ?.map((e) => OrderProResponse.fromJson(e as Map<String, dynamic>))
          .toList(),
      client: json['client'] == null
          ? null
          : ClientResponse.fromJson(json['client'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$OrderResponseToJson(
  OrderResponse instance,
) => <String, dynamic>{
  'id': instance.id,
  'status': instance.status,
  'paid_amount': instance.paidAmount,
  'admin_note': ?instance.adminNote,
  'client_note': ?instance.clientNote,
  'created_at': instance.createdAt.toIso8601String(),
  'order_products': ?instance.orderProducts?.map((e) => e.toJson()).toList(),
  'client': ?instance.client?.toJson(),
};
