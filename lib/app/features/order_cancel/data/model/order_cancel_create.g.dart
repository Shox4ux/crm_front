// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'order_cancel_create.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

OrderCancelCreate _$OrderCancelCreateFromJson(Map<String, dynamic> json) =>
    OrderCancelCreate(
      orderId: (json['order_id'] as num?)?.toInt(),
      cancelReason: json['cancel_reason'] as String,
      cancelType: (json['cancel_type'] as num).toInt(),
      cancelerId: (json['canceler_id'] as num?)?.toInt(),
    );

Map<String, dynamic> _$OrderCancelCreateToJson(OrderCancelCreate instance) =>
    <String, dynamic>{
      'order_id': ?instance.orderId,
      'cancel_reason': instance.cancelReason,
      'cancel_type': instance.cancelType,
      'canceler_id': ?instance.cancelerId,
    };
