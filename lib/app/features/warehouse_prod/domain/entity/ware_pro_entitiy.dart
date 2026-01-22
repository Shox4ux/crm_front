import 'package:crm_app/app/features/product/data/model/product_response.dart';

class WareProEntity {
  final int id;
  final ProductResponse? product;
  final int warehouseId;
  final int status;
  final DateTime? arrivesAt;
  final int quantity;

  WareProEntity({
    required this.id,
    required this.product,
    required this.warehouseId,
    required this.status,
    required this.arrivesAt,
    required this.quantity,
  });
}
