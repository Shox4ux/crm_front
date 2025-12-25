import 'package:crm_app/app/features/client/data/model/client_product_response.dart';
import 'package:crm_app/app/features/client/domain/entity/client_entity.dart';
import 'package:crm_app/app/features/order/data/model/order_response.dart';
import 'package:crm_app/app/features/user/data/model/user_response.dart';
import 'package:json_annotation/json_annotation.dart';

part 'client_response.g.dart';

@JsonSerializable()
class ClientResponse extends ClientEntity {
  ClientResponse({
    required super.id,
    required super.user,
    required super.products,
    required super.orders,
    required super.createdAt,
  });

  Map<String, dynamic> toJson() => _$ClientResponseToJson(this);

  factory ClientResponse.fromJson(Map<String, dynamic> map) =>
      _$ClientResponseFromJson(map);

  Map<String, dynamic> toMap() => _$ClientResponseToJson(this);

  factory ClientResponse.fromMap(Map<String, dynamic> map) =>
      _$ClientResponseFromJson(map);
}
