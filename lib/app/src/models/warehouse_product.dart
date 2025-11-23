import 'package:crm_app/app/src/models/product_model.dart';
import 'package:crm_app/app/src/models/warehouse_model.dart';

class WarehouseProduct {
  final Warehouse? warehouse;
  final Product? productInfo;
  final int? quantity;
  final String? status;
  final DateTime? arrivalTime;

  WarehouseProduct({
    this.arrivalTime,
    required this.warehouse,
    required this.productInfo,
    required this.quantity,
    required this.status,
  });
}
