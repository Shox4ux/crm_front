// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'product_expense_bulk.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ProductExpenseBulk _$ProductExpenseBulkFromJson(Map<String, dynamic> json) =>
    ProductExpenseBulk(
      productId: (json['product_id'] as num).toInt(),
      items: (json['items'] as List<dynamic>?)
          ?.map((e) => ProductExpenseWrite.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$ProductExpenseBulkToJson(ProductExpenseBulk instance) =>
    <String, dynamic>{
      'product_id': instance.productId,
      'items': ?instance.items?.map((e) => e.toJson()).toList(),
    };
