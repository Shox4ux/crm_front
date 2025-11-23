// ignore_for_file: public_member_api_docs, sort_constructors_first

import 'package:json_annotation/json_annotation.dart';

import 'client_product_read.dart';
import '../order/order_read.dart';
import '../user/user_read.dart';

part 'client_read.g.dart';

@JsonSerializable()
class ClientRead {
  final int id;
  final String phone;
  final String address;
  final UserRead user;
  final List<ClientProductRead>? products;
  final List<OrderRead>? orders;
  final DateTime createdAt;

  ClientRead({
    required this.id,
    required this.phone,
    required this.address,
    required this.user,
    this.products,
    this.orders,
    required this.createdAt,
  });

  Map<String, dynamic> toJson() => _$ClientReadToJson(this);

  factory ClientRead.fromJson(Map<String, dynamic> map) =>
      _$ClientReadFromJson(map);

  Map<String, dynamic> toMap() => _$ClientReadToJson(this);

  factory ClientRead.fromMap(Map<String, dynamic> map) =>
      _$ClientReadFromJson(map);

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is ClientRead && runtimeType == other.runtimeType && id == other.id;

  @override
  int get hashCode => id.hashCode;
}
