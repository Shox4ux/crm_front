import 'package:json_annotation/json_annotation.dart';
import 'package:crm_app/app/src/data/remote/models/request/product/product_expense_write.dart';

part 'product_expense_bulk.g.dart';

@JsonSerializable()
class ProductExpenseBulk {
  final int productId;
  final List<ProductExpenseWrite>? items;
  ProductExpenseBulk({required this.productId, this.items});

  Map<String, dynamic> toJson() => _$ProductExpenseBulkToJson(this);

  factory ProductExpenseBulk.fromJson(Map<String, dynamic> map) =>
      _$ProductExpenseBulkFromJson(map);

  Map<String, dynamic> toMap() => _$ProductExpenseBulkToJson(this);

  factory ProductExpenseBulk.fromMap(Map<String, dynamic> map) =>
      _$ProductExpenseBulkFromJson(map);
}
