import 'package:json_annotation/json_annotation.dart';
part 'product_expense_write.g.dart';

@JsonSerializable()
class ProductExpenseWrite {
  final String name;
  final double amount;
  ProductExpenseWrite({required this.name, required this.amount});

  Map<String, dynamic> toJson() => _$ProductExpenseWriteToJson(this);

  factory ProductExpenseWrite.fromJson(Map<String, dynamic> map) =>
      _$ProductExpenseWriteFromJson(map);

  Map<String, dynamic> toMap() => _$ProductExpenseWriteToJson(this);

  factory ProductExpenseWrite.fromMap(Map<String, dynamic> map) =>
      _$ProductExpenseWriteFromJson(map);
}
