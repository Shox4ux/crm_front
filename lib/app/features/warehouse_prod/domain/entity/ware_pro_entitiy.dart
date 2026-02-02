import 'package:crm_app/app/features/product/data/model/product_response.dart';
import 'package:crm_app/app/features/warehouse/data/model/warehouse_response.dart';

class WareProEntity {
  final int id;
  final ProductResponse? product;
  final WarehouseResponse? warehouse;
  final int warehouseId;
  final int status;
  final DateTime? arrivesAt;
  final int quantity;

  WareProEntity({
    required this.warehouse,
    required this.id,
    required this.product,
    required this.warehouseId,
    required this.status,
    required this.arrivesAt,
    required this.quantity,
  });
}
