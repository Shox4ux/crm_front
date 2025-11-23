// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:json_annotation/json_annotation.dart';

import '../product/product_read.dart';

part 'warehouse_product_read.g.dart';

@JsonSerializable()
class WarehouseProductRead {
  final int id;
  final int warehouseId;
  final ProductRead? product;
  final int status;
  final DateTime? arrivesAt;
  final int quantity;
  final DateTime? createdAt;
  WarehouseProductRead({
    required this.id,
    required this.warehouseId,
    this.product,
    required this.status,
    this.arrivesAt,
    required this.quantity,
    this.createdAt,
  });

  Map<String, dynamic> toJson() => _$WarehouseProductReadToJson(this);

  factory WarehouseProductRead.fromJson(Map<String, dynamic> map) =>
      _$WarehouseProductReadFromJson(map);
  Map<String, dynamic> toMap() => _$WarehouseProductReadToJson(this);

  factory WarehouseProductRead.fromMap(Map<String, dynamic> map) =>
      _$WarehouseProductReadFromJson(map);

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is WarehouseProductRead &&
          runtimeType == other.runtimeType &&
          id == other.id;

  @override
  int get hashCode => id.hashCode;
}
