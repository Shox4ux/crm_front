// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'product_expense_bulk_update.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ProdExpBulkUpdate _$ProdExpBulkUpdateFromJson(Map<String, dynamic> json) =>
    ProdExpBulkUpdate(
      newExp: json['new_exp'] == null
          ? null
          : NewExp.fromJson(json['new_exp'] as Map<String, dynamic>),
      updateExps:
          (json['update_exps'] as List<dynamic>?)
              ?.map((e) => UpdatedExp.fromJson(e as Map<String, dynamic>))
              .toList() ??
          [],
      removed:
          (json['removed'] as List<dynamic>?)
              ?.map((e) => (e as num).toInt())
              .toList() ??
          [],
    );

Map<String, dynamic> _$ProdExpBulkUpdateToJson(ProdExpBulkUpdate instance) =>
    <String, dynamic>{
      'new_exp': ?instance.newExp?.toJson(),
      'update_exps': ?instance.updateExps?.map((e) => e.toJson()).toList(),
      'removed': ?instance.removed,
    };

UpdatedExp _$UpdatedExpFromJson(Map<String, dynamic> json) => UpdatedExp(
  id: (json['id'] as num).toInt(),
  name: json['name'] as String,
  amount: (json['amount'] as num).toDouble(),
);

Map<String, dynamic> _$UpdatedExpToJson(UpdatedExp instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'amount': instance.amount,
    };

NewExp _$NewExpFromJson(Map<String, dynamic> json) => NewExp(
  productId: (json['product_id'] as num).toInt(),
  items: (json['items'] as List<dynamic>?)
      ?.map((e) => NewExpItem.fromJson(e as Map<String, dynamic>))
      .toList(),
);

Map<String, dynamic> _$NewExpToJson(NewExp instance) => <String, dynamic>{
  'product_id': instance.productId,
  'items': ?instance.items?.map((e) => e.toJson()).toList(),
};

NewExpItem _$NewExpItemFromJson(Map<String, dynamic> json) => NewExpItem(
  name: json['name'] as String,
  amount: (json['amount'] as num).toDouble(),
);

Map<String, dynamic> _$NewExpItemToJson(NewExpItem instance) =>
    <String, dynamic>{'name': instance.name, 'amount': instance.amount};
