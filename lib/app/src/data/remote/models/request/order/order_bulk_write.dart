// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:json_annotation/json_annotation.dart';

import 'order_prod_write.dart';

part 'order_bulk_write.g.dart';

@JsonSerializable()
class OrderProdBulkWrite {
  final int orderId;
  final List<OrderProdWrite>? items;

  OrderProdBulkWrite({required this.orderId, required this.items});

  Map<String, dynamic> toMap() => _$OrderProdBulkWriteToJson(this);

  factory OrderProdBulkWrite.fromMap(Map<String, dynamic> map) =>
      _$OrderProdBulkWriteFromJson(map);

  Map<String, dynamic> toJson() => _$OrderProdBulkWriteToJson(this);

  factory OrderProdBulkWrite.fromJson(String source) =>
      OrderProdBulkWrite.fromMap(json.decode(source) as Map<String, dynamic>);
}
