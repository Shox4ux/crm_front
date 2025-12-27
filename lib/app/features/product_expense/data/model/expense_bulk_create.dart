import 'package:crm_app/app/features/product_expense/data/model/expense_create.dart';
import 'package:json_annotation/json_annotation.dart';

part 'expense_bulk_create.g.dart';

@JsonSerializable()
class ExpenseBulkCreate {
  final int productId;
  final List<ExpenseCreate>? items;
  ExpenseBulkCreate({required this.productId, this.items});

  Map<String, dynamic> toJson() => _$ExpenseBulkCreateToJson(this);

  factory ExpenseBulkCreate.fromJson(Map<String, dynamic> map) =>
      _$ExpenseBulkCreateFromJson(map);
}
