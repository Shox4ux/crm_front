// ignore_for_file: public_member_api_docs, sort_constructors_first
import '../../app_database.dart';

class OrderWithProducts {
  OrderTable order;
  List<OrderProductTable> products;
  OrderWithProducts({required this.order, required this.products});
}

class ClientWithOrders {
  ClientTable client;
  List<OrderWithProducts> orders;
  ClientWithOrders({required this.client, required this.orders});
}
