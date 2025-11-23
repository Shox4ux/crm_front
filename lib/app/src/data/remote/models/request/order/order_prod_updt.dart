// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:json_annotation/json_annotation.dart';
part 'order_prod_updt.g.dart';

@JsonSerializable()
class OrderProdUpdt {
  final num customQuantity;
  final num customPrice;

  OrderProdUpdt({required this.customQuantity, required this.customPrice});

  Map<String, dynamic> toMap() => _$OrderProdUpdtToJson(this);

  factory OrderProdUpdt.fromMap(Map<String, dynamic> map) =>
      _$OrderProdUpdtFromJson(map);

  String toJson() => json.encode(toMap());

  factory OrderProdUpdt.fromJson(String source) =>
      OrderProdUpdt.fromMap(json.decode(source) as Map<String, dynamic>);
}
