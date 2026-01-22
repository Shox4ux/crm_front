import 'package:crm_app/app/features/order_product/data/model/order_pro_create.dart';
import 'package:crm_app/app/features/order_product/data/model/order_pro_update.dart';
import 'package:json_annotation/json_annotation.dart';

part 'order_update.g.dart';

@JsonSerializable()
class OrderUpdate {
  final int status;
  final double paidAmount;
  final List<int>? deletedOrderProducts;
  final List<OrderProUpdate>? updatedOrderProducts; // <OrderProUpdate>
  final List<OrderProCreate>? newOrderProducts;
  final String? adminNote;
  final String? clientNote;
  OrderUpdate({
    required this.status,
    required this.paidAmount,
    this.adminNote,
    this.clientNote,
    this.deletedOrderProducts,
    this.updatedOrderProducts,
    this.newOrderProducts,
  });

  Map<String, dynamic> toJson() => _$OrderUpdateToJson(this);

  factory OrderUpdate.fromJson(Map<String, dynamic> map) =>
      _$OrderUpdateFromJson(map);
}
