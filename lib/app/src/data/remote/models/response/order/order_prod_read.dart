import 'package:json_annotation/json_annotation.dart';
import '../warehouse/warehouse_product_read.dart';

part 'order_prod_read.g.dart';

@JsonSerializable()
class OrderProdRead {
  final int id;
  final int customQuantity;
  final double customPrice;
  final WarehouseProductRead warehouseProduct;
  final DateTime createdAt;
  OrderProdRead({
    required this.id,
    required this.customQuantity,
    required this.customPrice,
    required this.warehouseProduct,
    required this.createdAt,
  });

  Map<String, dynamic> toJson() => _$OrderProdReadToJson(this);

  factory OrderProdRead.fromJson(Map<String, dynamic> map) =>
      _$OrderProdReadFromJson(map);

  Map<String, dynamic> toMap() => _$OrderProdReadToJson(this);

  factory OrderProdRead.fromMap(Map<String, dynamic> map) =>
      _$OrderProdReadFromJson(map);
}
