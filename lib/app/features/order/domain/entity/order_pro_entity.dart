import 'package:crm_app/app/features/warehouse_prod/data/model/ware_pro_response.dart';

class OrderProEntity {
  final int id;
  final int customQuantity;
  final double customPrice;
  final WareProResponse warehouseProduct;
  final DateTime createdAt;

  OrderProEntity({
    required this.id,
    required this.customQuantity,
    required this.customPrice,
    required this.warehouseProduct,
    required this.createdAt,
  });
}
