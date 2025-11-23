import 'package:json_annotation/json_annotation.dart';
part 'product_expense_read.g.dart';

@JsonSerializable()
class ProductExpenseRead {
  final int id;
  final String name;
  final double amount;
  ProductExpenseRead({
    required this.id,
    required this.name,
    required this.amount,
  });
  Map<String, dynamic> toJson() => _$ProductExpenseReadToJson(this);

  factory ProductExpenseRead.fromJson(Map<String, dynamic> map) =>
      _$ProductExpenseReadFromJson(map);

  Map<String, dynamic> toMap() => _$ProductExpenseReadToJson(this);

  factory ProductExpenseRead.fromMap(Map<String, dynamic> map) =>
      _$ProductExpenseReadFromJson(map);
}
