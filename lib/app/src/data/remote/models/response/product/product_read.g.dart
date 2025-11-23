// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'product_read.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ProductRead _$ProductReadFromJson(Map<String, dynamic> json) => ProductRead(
  (json['measure'] as num?)?.toInt(),
  (json['total_quantity'] as num).toInt(),
  (json['active_quantity'] as num).toInt(),
  id: (json['id'] as num).toInt(),
  name: json['name'] as String,
  imgUrl: json['img_url'] as String?,
  basePrice: (json['base_price'] as num).toDouble(),
  sellPrice: (json['sell_price'] as num).toDouble(),
  base_expenses: (json['base_expenses'] as List<dynamic>?)
      ?.map((e) => ProductExpenseRead.fromJson(e as Map<String, dynamic>))
      .toList(),
  createdAt: DateTime.parse(json['created_at'] as String),
);

Map<String, dynamic> _$ProductReadToJson(ProductRead instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'img_url': ?instance.imgUrl,
      'base_price': instance.basePrice,
      'sell_price': instance.sellPrice,
      'base_expenses': ?instance.base_expenses?.map((e) => e.toJson()).toList(),
      'measure': ?instance.measure,
      'total_quantity': instance.total_quantity,
      'active_quantity': instance.active_quantity,
      'created_at': instance.createdAt.toIso8601String(),
    };
