// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'product_expense_write.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ProductExpenseWrite _$ProductExpenseWriteFromJson(Map<String, dynamic> json) =>
    ProductExpenseWrite(
      name: json['name'] as String,
      amount: (json['amount'] as num).toDouble(),
    );

Map<String, dynamic> _$ProductExpenseWriteToJson(
  ProductExpenseWrite instance,
) => <String, dynamic>{'name': instance.name, 'amount': instance.amount};
