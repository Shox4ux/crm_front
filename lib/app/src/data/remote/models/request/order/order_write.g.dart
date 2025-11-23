// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'order_write.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

OrderWrite _$OrderWriteFromJson(Map<String, dynamic> json) => OrderWrite(
  clientId: (json['client_id'] as num).toInt(),
  status: (json['status'] as num).toInt(),
  paidAmount: (json['paid_amount'] as num).toDouble(),
  adminNote: json['admin_note'] as String?,
  clientNote: json['client_note'] as String?,
);

Map<String, dynamic> _$OrderWriteToJson(OrderWrite instance) =>
    <String, dynamic>{
      'client_id': instance.clientId,
      'status': instance.status,
      'paid_amount': instance.paidAmount,
      'admin_note': ?instance.adminNote,
      'client_note': ?instance.clientNote,
    };
