import 'package:crm_app/app/features/order/domain/entity/order_pro_entity.dart';
import 'package:crm_app/app/features/warehouse_prod/data/model/ware_pro_response.dart';
import 'package:json_annotation/json_annotation.dart';
part 'order_pro_response.g.dart';

@JsonSerializable()
class OrderProResponse extends OrderProEntity {
  OrderProResponse({
    required super.id,
    required super.customQuantity,
    required super.customPrice,
    required super.warehouseProduct,
    required super.createdAt,
  });

  Map<String, dynamic> toJson() => _$OrderProResponseToJson(this);

  factory OrderProResponse.fromJson(Map<String, dynamic> map) =>
      _$OrderProResponseFromJson(map);
}
