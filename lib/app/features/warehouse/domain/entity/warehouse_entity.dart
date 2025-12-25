import 'package:crm_app/app/features/warehouse_prod/data/model/ware_pro_response.dart';

class WarehouseEntity {
  final int id;
  final String name;
  final String address;
  final List<WareProResponse>? products;
  final DateTime createdAt;

  WarehouseEntity({
    required this.id,
    required this.name,
    required this.address,
    required this.products,
    required this.createdAt,
  });
}
