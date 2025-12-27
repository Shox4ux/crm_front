// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'expense_create.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ExpenseCreate _$ExpenseCreateFromJson(Map<String, dynamic> json) =>
    ExpenseCreate(
      name: json['name'] as String,
      amount: (json['amount'] as num).toDouble(),
    );

Map<String, dynamic> _$ExpenseCreateToJson(ExpenseCreate instance) =>
    <String, dynamic>{'name': instance.name, 'amount': instance.amount};
