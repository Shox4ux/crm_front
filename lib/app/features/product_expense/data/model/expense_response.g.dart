// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'expense_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ProductExpenseResponse _$ProductExpenseResponseFromJson(
  Map<String, dynamic> json,
) => ProductExpenseResponse(
  id: (json['id'] as num).toInt(),
  name: json['name'] as String,
  amount: (json['amount'] as num).toDouble(),
);

Map<String, dynamic> _$ProductExpenseResponseToJson(
  ProductExpenseResponse instance,
) => <String, dynamic>{
  'id': instance.id,
  'name': instance.name,
  'amount': instance.amount,
};
