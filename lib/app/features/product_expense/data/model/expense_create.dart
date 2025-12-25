import 'package:json_annotation/json_annotation.dart';
part 'expense_create.g.dart';

@JsonSerializable()
class ProductExpenseCreate {
  final String name;
  final double amount;
  ProductExpenseCreate({required this.name, required this.amount});

  Map<String, dynamic> toJson() => _$ProductExpenseCreateToJson(this);

  factory ProductExpenseCreate.fromJson(Map<String, dynamic> map) =>
      _$ProductExpenseCreateFromJson(map);

  Map<String, dynamic> toMap() => _$ProductExpenseCreateToJson(this);

  factory ProductExpenseCreate.fromMap(Map<String, dynamic> map) =>
      _$ProductExpenseCreateFromJson(map);
}
