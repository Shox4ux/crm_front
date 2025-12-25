// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'product_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ProductResponse _$ProductResponseFromJson(Map<String, dynamic> json) =>
    ProductResponse(
      id: (json['id'] as num).toInt(),
      name: json['name'] as String,
      imgUrl: json['img_url'] as String?,
      basePrice: (json['base_price'] as num).toDouble(),
      sellPrice: (json['sell_price'] as num).toDouble(),
      baseExpenses: (json['base_expenses'] as List<dynamic>?)
          ?.map(
            (e) => ProductExpenseResponse.fromJson(e as Map<String, dynamic>),
          )
          .toList(),
      measure: (json['measure'] as num?)?.toInt(),
      totalQuantity: (json['total_quantity'] as num).toInt(),
      activeQuantity: (json['active_quantity'] as num).toInt(),
      createdAt: DateTime.parse(json['created_at'] as String),
    );

Map<String, dynamic> _$ProductResponseToJson(ProductResponse instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'img_url': ?instance.imgUrl,
      'base_price': instance.basePrice,
      'sell_price': instance.sellPrice,
      'base_expenses': ?instance.baseExpenses?.map((e) => e.toJson()).toList(),
      'measure': ?instance.measure,
      'total_quantity': instance.totalQuantity,
      'active_quantity': instance.activeQuantity,
      'created_at': instance.createdAt.toIso8601String(),
    };
