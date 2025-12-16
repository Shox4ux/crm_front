import 'package:crm_app/app/features/client/data/model/client_product_response.dart';
import 'package:crm_app/app/features/client/domain/entity/client_entity.dart';
import 'package:crm_app/app/features/user/data/model/user_response.dart';
import 'package:crm_app/app/src/data/remote/models/response/order/order_read.dart';
import 'package:json_annotation/json_annotation.dart';

part 'client_response.g.dart';

@JsonSerializable()
class ClientResponse extends ClientEntity {
  final int id;
  final UserResponse user;
  final List<ClientProductRead>? products;
  final List<OrderRead>? orders;
  final String createdAt;

  ClientResponse({
    required this.id,
    required this.user,
    this.products,
    this.orders,
    required this.createdAt,
  }) : super(
         id: id,
         user: user,
         products: products,
         orders: orders,
         createdAt: createdAt,
       );

  Map<String, dynamic> toJson() => _$ClientResponseToJson(this);

  factory ClientResponse.fromJson(Map<String, dynamic> map) =>
      _$ClientResponseFromJson(map);

  Map<String, dynamic> toMap() => _$ClientResponseToJson(this);

  factory ClientResponse.fromMap(Map<String, dynamic> map) =>
      _$ClientResponseFromJson(map);
}
