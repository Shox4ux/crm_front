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
);

Map<String, dynamic> _$OrderUpdateToJson(OrderUpdate instance) =>
    <String, dynamic>{
      'status': instance.status,
      'paid_amount': instance.paidAmount,
      'admin_note': ?instance.adminNote,
      'client_note': ?instance.clientNote,
    };
