// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:json_annotation/json_annotation.dart';

part 'order_write.g.dart';

@JsonSerializable()
class OrderWrite {
  final int clientId;
  final int status;
  final double paidAmount;
  final String? adminNote;
  final String? clientNote;
  OrderWrite({
    required this.clientId,
    required this.status,
    required this.paidAmount,
    this.adminNote,
    this.clientNote,
  });

  Map<String, dynamic> toMap() => _$OrderWriteToJson(this);

  factory OrderWrite.fromMap(Map<String, dynamic> map) =>
      _$OrderWriteFromJson(map);

  String toJson() => json.encode(toMap());

  factory OrderWrite.fromJson(String source) =>
      OrderWrite.fromMap(json.decode(source) as Map<String, dynamic>);
}
