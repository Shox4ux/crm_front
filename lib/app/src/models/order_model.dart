// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:crm_app/app/src/models/client_model.dart';
import 'package:crm_app/app/src/models/order_product_model.dart';
import 'package:crm_app/app/src/models/warehouse_model.dart';
import 'package:crm_app/app/utils/enums/order_status.dart';

class Order {
  final int? id;
  final Client? soldClient;
  final List<OrderProduct>? soldProducts;
  final num? totalAmount;
  final num? paidAmount;
  final OrderStatus? saleStatus; // "paid" | "partial" | "unpaid"
  final DateTime? salesMadeAt;

  Order({
    this.id,
    this.soldClient,
    this.soldProducts,
    this.totalAmount,
    this.paidAmount,
    this.saleStatus,
    this.salesMadeAt,
  });

  factory Order.fake({
    Client? client,
    num? totalPrice,
    List<OrderProduct>? soldProducts,
    Warehouse? hostWarehouse,
    double? paidAmount,
    OrderStatus? status,
  }) {
    return Order(
      soldClient: client,
      soldProducts: soldProducts,
      totalAmount: totalPrice,
      paidAmount: paidAmount,
      saleStatus: status,
    );
  }

  Order copyWith({
    int? id,
    Client? soldClient,
    List<OrderProduct>? soldProducts,
    double? totalAmount,
    double? paidAmount,
    OrderStatus? saleStatus,
    DateTime? salesMadeAt,
  }) {
    return Order(
      id: id ?? this.id,
      soldClient: soldClient ?? this.soldClient,
      soldProducts: soldProducts ?? this.soldProducts,
      totalAmount: totalAmount ?? this.totalAmount,
      paidAmount: paidAmount ?? this.paidAmount,
      saleStatus: saleStatus ?? this.saleStatus,
      salesMadeAt: salesMadeAt ?? this.salesMadeAt,
    );
  }
}

double total(List<OrderProduct>? soldProducts) {
  double total = 0;
  if (soldProducts != null && soldProducts != []) {
    for (var item in soldProducts) {
      var d = item.soldPrice! * item.soldQuantity!;
      total += d;
      return total;
    }
  }
  return total;
}

List<Order> orderList = [
  Order.fake(
    soldProducts: salesList,
    client: clientList[0],
    totalPrice: 0,
    paidAmount: 0,
    status: OrderStatus.paid,
    hostWarehouse: warehouseList[0],
  ),
  Order.fake(
    soldProducts: salesList,
    client: clientList[0],
    paidAmount: 0.0,
    status: OrderStatus.unpaid,
    hostWarehouse: warehouseList[1],
  ),
];
