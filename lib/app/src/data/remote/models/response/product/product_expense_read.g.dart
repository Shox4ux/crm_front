// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'product_expense_read.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ProductExpenseRead _$ProductExpenseReadFromJson(Map<String, dynamic> json) =>
    ProductExpenseRead(
      id: (json['id'] as num).toInt(),
      name: json['name'] as String,
      amount: (json['amount'] as num).toDouble(),
    );

Map<String, dynamic> _$ProductExpenseReadToJson(ProductExpenseRead instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'amount': instance.amount,
    };
