import 'dart:convert';

import 'package:json_annotation/json_annotation.dart';

part 'warehouse_product_write.g.dart';

@JsonSerializable()
class WarehouseProductWrite {
  final int productId;
  final int status;
  final int quantity;
  WarehouseProductWrite({
    required this.productId,
    required this.status,
    required this.quantity,
  });

  Map<String, dynamic> toMap() => _$WarehouseProductWriteToJson(this);

  factory WarehouseProductWrite.fromMap(Map<String, dynamic> map) =>
      _$WarehouseProductWriteFromJson(map);

  String toJson() => json.encode(toMap());

  factory WarehouseProductWrite.fromJson(String source) =>
      WarehouseProductWrite.fromMap(
        json.decode(source) as Map<String, dynamic>,
      );
}
