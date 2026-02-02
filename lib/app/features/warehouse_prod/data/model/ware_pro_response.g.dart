// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'ware_pro_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

WareProResponse _$WareProResponseFromJson(Map<String, dynamic> json) =>
    WareProResponse(
      id: (json['id'] as num).toInt(),
      product: json['product'] == null
          ? null
          : ProductResponse.fromJson(json['product'] as Map<String, dynamic>),
      warehouseId: (json['warehouse_id'] as num).toInt(),
      warehouse: json['warehouse'] == null
          ? null
          : WarehouseResponse.fromJson(
              json['warehouse'] as Map<String, dynamic>,
            ),
      status: (json['status'] as num).toInt(),
      arrivesAt: json['arrives_at'] == null
          ? null
          : DateTime.parse(json['arrives_at'] as String),
      quantity: (json['quantity'] as num).toInt(),
    );

Map<String, dynamic> _$WareProResponseToJson(WareProResponse instance) =>
    <String, dynamic>{
      'id': instance.id,
      'product': ?instance.product?.toJson(),
      'warehouse': ?instance.warehouse?.toJson(),
      'warehouse_id': instance.warehouseId,
      'status': instance.status,
      'arrives_at': ?instance.arrivesAt?.toIso8601String(),
      'quantity': instance.quantity,
    };
