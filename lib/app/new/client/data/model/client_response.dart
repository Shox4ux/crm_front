// ignore_for_file: public_member_api_docs, sort_constructors_first

import 'package:crm_app/app/new/user/data/model/user_response.dart';
import 'package:crm_app/app/new/client/domain/entity/client_entity.dart';
import 'package:crm_app/app/src/data/remote/models/response/order/order_read.dart';
import 'package:json_annotation/json_annotation.dart';

import 'client_product_response.dart';

part 'client_response.g.dart';

@JsonSerializable()
class ClientResponse extends ClientEntity {
  final int id;
  final String phone;
  final String address;
  final UserResponse user;
  final List<ClientProductRead>? products;
  final List<OrderRead>? orders;
  final DateTime createdAt;

  ClientResponse({
    required this.id,
    required this.phone,
    required this.address,
    required this.user,
    this.products,
    this.orders,
    required this.createdAt,
  }) : super(
         id: id,
         phone: phone,
         address: address,
         user: user,
         products: products,
         orders: orders ?? [],
         createdAt: createdAt,
       );

  Map<String, dynamic> toJson() => _$ClientResponseToJson(this);

  factory ClientResponse.fromJson(Map<String, dynamic> map) =>
      _$ClientResponseFromJson(map);

  Map<String, dynamic> toMap() => _$ClientResponseToJson(this);

  factory ClientResponse.fromMap(Map<String, dynamic> map) =>
      _$ClientResponseFromJson(map);

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is ClientResponse &&
          runtimeType == other.runtimeType &&
          id == other.id;

  @override
  int get hashCode => id.hashCode;
}
