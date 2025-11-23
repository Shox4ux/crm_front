// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'client_product_read.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ClientProductRead _$ClientProductReadFromJson(Map<String, dynamic> json) =>
    ClientProductRead(
      id: (json['id'] as num).toInt(),
      customPrice: (json['custom_price'] as num).toDouble(),
      product: json['product'] == null
          ? null
          : ProductRead.fromJson(json['product'] as Map<String, dynamic>),
      createdAt: DateTime.parse(json['created_at'] as String),
    );

Map<String, dynamic> _$ClientProductReadToJson(ClientProductRead instance) =>
    <String, dynamic>{
      'id': instance.id,
      'custom_price': instance.customPrice,
      'product': ?instance.product?.toJson(),
      'created_at': instance.createdAt.toIso8601String(),
    };
