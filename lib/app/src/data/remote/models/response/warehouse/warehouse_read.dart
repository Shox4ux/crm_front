import 'package:json_annotation/json_annotation.dart';
import 'warehouse_product_read.dart';
part 'warehouse_read.g.dart';

@JsonSerializable()
class WarehouseRead {
  final int id;
  final String name;
  final String address;
  final List<WarehouseProductRead>? products;
  final DateTime createdAt;
  WarehouseRead({
    required this.id,
    required this.name,
    required this.address,
    required this.products,
    required this.createdAt,
  });

  Map<String, dynamic> toJson() => _$WarehouseReadToJson(this);

  factory WarehouseRead.fromJson(Map<String, dynamic> map) =>
      _$WarehouseReadFromJson(map);

  Map<String, dynamic> toMap() => _$WarehouseReadToJson(this);

  factory WarehouseRead.fromMap(Map<String, dynamic> map) =>
      _$WarehouseReadFromJson(map);

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is WarehouseRead &&
          runtimeType == other.runtimeType &&
          id == other.id;

  @override
  int get hashCode => id.hashCode;
}
