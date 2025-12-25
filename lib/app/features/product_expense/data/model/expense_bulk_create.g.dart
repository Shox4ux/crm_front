// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'expense_bulk_create.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ProductExpenseBulkCreate _$ProductExpenseBulkCreateFromJson(
  Map<String, dynamic> json,
) => ProductExpenseBulkCreate(
  productId: (json['product_id'] as num).toInt(),
  items: (json['items'] as List<dynamic>?)
      ?.map((e) => ProductExpenseCreate.fromJson(e as Map<String, dynamic>))
      .toList(),
);

Map<String, dynamic> _$ProductExpenseBulkCreateToJson(
  ProductExpenseBulkCreate instance,
) => <String, dynamic>{
  'product_id': instance.productId,
  'items': ?instance.items?.map((e) => e.toJson()).toList(),
};
