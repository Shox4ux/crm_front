import 'package:crm_app/app/features/client/data/model/client_response.dart';
import 'package:crm_app/app/features/order_product/data/model/order_pro_response.dart';
import 'package:crm_app/app/features/order/domain/entity/order_entity.dart';
import 'package:json_annotation/json_annotation.dart';
part 'order_response.g.dart';

@JsonSerializable()
class OrderResponse extends OrderEntity {
  OrderResponse({
    required super.id,
    required super.status,
    required super.paidAmount,
    super.adminNote,
    super.clientNote,
    required super.createdAt,
    super.orderProducts,
    super.client,
  });

  Map<String, dynamic> toJson() => _$OrderResponseToJson(this);

  factory OrderResponse.fromJson(Map<String, dynamic> map) =>
      _$OrderResponseFromJson(map);
}
