import 'package:crm_app/app/features/product_expense/domain/entity/expense_entity.dart';

extension BasePriceCalculate on List<ExpenseEntity> {
  String calculateBasePrice(int quantity) {
    double totalExpense = 0;
    for (var expense in this) {
      totalExpense += expense.amount;
    }
    return (totalExpense / quantity).toStringAsFixed(2);
  }
}
