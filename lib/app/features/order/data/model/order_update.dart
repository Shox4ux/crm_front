// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:json_annotation/json_annotation.dart';

part 'order_update.g.dart';

@JsonSerializable()
class OrderUpdate {
  final int status;
  final double paidAmount;
  final String? adminNote;
  final String? clientNote;
  OrderUpdate({
    required this.status,
    required this.paidAmount,
    this.adminNote,
    this.clientNote,
  });

  Map<String, dynamic> toMap() => _$OrderUpdateToJson(this);

  factory OrderUpdate.fromMap(Map<String, dynamic> map) =>
      _$OrderUpdateFromJson(map);

  String toJson() => json.encode(toMap());

  factory OrderUpdate.fromJson(String source) =>
      OrderUpdate.fromMap(json.decode(source) as Map<String, dynamic>);
}
