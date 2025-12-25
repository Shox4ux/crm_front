import 'package:crm_app/app/features/product_expense/domain/entity/expense_entity.dart';
import 'package:json_annotation/json_annotation.dart';
part 'expense_response.g.dart';

@JsonSerializable()
class ProductExpenseResponse extends ExpenseEntity {
  ProductExpenseResponse({
    required super.id,
    required super.name,
    required super.amount,
  });
  Map<String, dynamic> toJson() => _$ProductExpenseResponseToJson(this);

  factory ProductExpenseResponse.fromJson(Map<String, dynamic> map) =>
      _$ProductExpenseResponseFromJson(map);
}
