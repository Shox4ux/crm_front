// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'expense_bulk_create.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ExpenseBulkCreate _$ExpenseBulkCreateFromJson(Map<String, dynamic> json) =>
    ExpenseBulkCreate(
      productId: (json['product_id'] as num).toInt(),
      items: (json['items'] as List<dynamic>?)
          ?.map((e) => ExpenseCreate.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$ExpenseBulkCreateToJson(ExpenseBulkCreate instance) =>
    <String, dynamic>{
      'product_id': instance.productId,
      'items': ?instance.items?.map((e) => e.toJson()).toList(),
    };
