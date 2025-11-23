// ignore_for_file: public_member_api_docs, sort_constructors_first

import 'order_prod_read.dart';
import 'package:json_annotation/json_annotation.dart';

import '../client/client_read.dart';

part 'order_read.g.dart';

@JsonSerializable()
class OrderRead {
  final int id;
  final int status;
  final double paidAmount;
  final String? adminNote;
  final String? clientNote;
  final DateTime createdAt;
  final List<OrderProdRead>? orderProducts;
  final ClientRead? client;

  OrderRead({
    required this.id,
    required this.status,
    required this.paidAmount,
    this.adminNote,
    this.clientNote,
    required this.createdAt,
    this.orderProducts,
    this.client,
  });

  Map<String, dynamic> toJson() => _$OrderReadToJson(this);

  factory OrderRead.fromJson(Map<String, dynamic> map) =>
      _$OrderReadFromJson(map);

  Map<String, dynamic> toMap() => _$OrderReadToJson(this);

  factory OrderRead.fromMap(Map<String, dynamic> map) =>
      _$OrderReadFromJson(map);
}
