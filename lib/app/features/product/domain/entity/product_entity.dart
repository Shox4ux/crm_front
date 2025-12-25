import 'package:crm_app/app/features/product_expense/data/model/expense_response.dart';

class ProductEntity {
  final int id;
  final String name;
  final String? imgUrl;
  final double basePrice;
  final double sellPrice;
  final List<ProductExpenseResponse>? baseExpenses;
  final int? measure;
  final int totalQuantity;
  final int activeQuantity;
  final DateTime createdAt;

  ProductEntity({
    required this.id,
    required this.name,
    required this.imgUrl,
    required this.basePrice,
    required this.sellPrice,
    required this.baseExpenses,
    required this.measure,
    required this.totalQuantity,
    required this.activeQuantity,
    required this.createdAt,
  });
}
