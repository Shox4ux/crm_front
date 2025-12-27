import 'package:crm_app/app/features/product_expense/domain/entity/expense_entity.dart';

extension ExpenseToRowList on ExpenseEntity {
  List<String> toRowList() {
    return [id.toString(), name, "\$${amount.toStringAsFixed(2)}"];
  }
}
