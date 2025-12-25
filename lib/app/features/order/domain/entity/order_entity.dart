import 'package:crm_app/app/features/client/data/model/client_response.dart';
import 'package:crm_app/app/features/order_product/data/model/order_pro_response.dart';

class OrderEntity {
  final int id;
  final int status;
  final double paidAmount;
  final String? adminNote;
  final String? clientNote;
  final DateTime createdAt;
  final List<OrderProResponse>? orderProducts;
  final ClientResponse? client;

  OrderEntity({
    required this.id,
    required this.status,
    required this.paidAmount,
    required this.adminNote,
    required this.clientNote,
    required this.createdAt,
    required this.orderProducts,
    required this.client,
  });
}
