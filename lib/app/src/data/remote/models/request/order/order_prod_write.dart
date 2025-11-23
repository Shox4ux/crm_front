// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:json_annotation/json_annotation.dart';

part 'order_prod_write.g.dart';

@JsonSerializable()
class OrderProdWrite {
  final num customPrice;
  final num customQuantity;
  final int warehouseProductId;
  OrderProdWrite({
    required this.customPrice,
    required this.customQuantity,
    required this.warehouseProductId,
  });

  Map<String, dynamic> toMap() => _$OrderProdWriteToJson(this);

  factory OrderProdWrite.fromMap(Map<String, dynamic> map) =>
      _$OrderProdWriteFromJson(map);

  Map<String, dynamic> toJson() => _$OrderProdWriteToJson(this);

  factory OrderProdWrite.fromJson(String source) =>
      OrderProdWrite.fromMap(json.decode(source) as Map<String, dynamic>);
}
