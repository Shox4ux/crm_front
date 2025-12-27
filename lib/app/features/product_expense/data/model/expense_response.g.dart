// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'expense_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ExpenseResponse _$ExpenseResponseFromJson(Map<String, dynamic> json) =>
    ExpenseResponse(
      id: (json['id'] as num).toInt(),
      name: json['name'] as String,
      amount: (json['amount'] as num).toDouble(),
    );

Map<String, dynamic> _$ExpenseResponseToJson(ExpenseResponse instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'amount': instance.amount,
    };
