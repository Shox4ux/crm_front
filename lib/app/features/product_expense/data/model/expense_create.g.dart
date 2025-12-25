// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'expense_create.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ProductExpenseCreate _$ProductExpenseCreateFromJson(
  Map<String, dynamic> json,
) => ProductExpenseCreate(
  name: json['name'] as String,
  amount: (json['amount'] as num).toDouble(),
);

Map<String, dynamic> _$ProductExpenseCreateToJson(
  ProductExpenseCreate instance,
) => <String, dynamic>{'name': instance.name, 'amount': instance.amount};
