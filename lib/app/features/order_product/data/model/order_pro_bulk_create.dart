import 'package:crm_app/app/features/order_product/data/model/order_pro_create.dart';
import 'package:json_annotation/json_annotation.dart';

part 'order_pro_bulk_create.g.dart';

@JsonSerializable()
class OrderProBulkCreate {
  final int orderId;
  final List<OrderProCreate>? items;

  OrderProBulkCreate({required this.orderId, required this.items});

  Map<String, dynamic> toJson() => _$OrderProBulkCreateToJson(this);
  factory OrderProBulkCreate.fromJson(Map<String, dynamic> map) =>
      _$OrderProBulkCreateFromJson(map);
}
