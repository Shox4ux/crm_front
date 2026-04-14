// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'order_cancel_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

OrderCancelResponse _$OrderCancelResponseFromJson(Map<String, dynamic> json) =>
    OrderCancelResponse(
      id: (json['id'] as num).toInt(),
      cancelReason: json['cancel_reason'] as String,
      cancelType: (json['cancel_type'] as num).toInt(),
      canceler: AdminResponse.fromJson(
        json['canceler'] as Map<String, dynamic>,
      ),
      createdAt: DateTime.parse(json['created_at'] as String),
    );

Map<String, dynamic> _$OrderCancelResponseToJson(
  OrderCancelResponse instance,
) => <String, dynamic>{
  'id': instance.id,
  'cancel_reason': instance.cancelReason,
  'cancel_type': instance.cancelType,
  'canceler': instance.canceler.toJson(),
  'created_at': instance.createdAt.toIso8601String(),
};
