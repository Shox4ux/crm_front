import 'package:crm_app/app/features/product_expense/data/model/expense_create.dart';
import 'package:json_annotation/json_annotation.dart';

part 'expense_bulk_create.g.dart';

@JsonSerializable()
class ProductExpenseBulkCreate {
  final int productId;
  final List<ProductExpenseCreate>? items;
  ProductExpenseBulkCreate({required this.productId, this.items});

  Map<String, dynamic> toJson() => _$ProductExpenseBulkCreateToJson(this);

  factory ProductExpenseBulkCreate.fromJson(Map<String, dynamic> map) =>
      _$ProductExpenseBulkCreateFromJson(map);
}
