import 'package:crm_app/app/features/order_product/data/model/order_pro_create.dart';
import 'package:json_annotation/json_annotation.dart';
part 'order_create.g.dart';

@JsonSerializable()
class OrderCreate {
  final int clientId;
  final int status;
  final double paidAmount;
  final double totalAmount;
  final DateTime? deliveryOn;
  final List<OrderProCreate>? orderProducts;
  final String? adminNote;
  final String? clientNote;
  OrderCreate({
    required this.totalAmount,
    required this.clientId,
    required this.status,
    required this.paidAmount,
    required this.deliveryOn,
    this.orderProducts,
    this.adminNote,
    this.clientNote,
  });

  Map<String, dynamic> toJson() => _$OrderCreateToJson(this);

  factory OrderCreate.fromJson(Map<String, dynamic> map) =>
      _$OrderCreateFromJson(map);
}
