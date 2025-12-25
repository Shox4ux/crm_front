import 'package:crm_app/app/features/order/data/model/order_response.dart';
import 'package:crm_app/app/features/user/data/model/user_response.dart';
import 'package:crm_app/app/features/client/data/model/client_product_response.dart';

class ClientEntity {
  final int id;
  final UserResponse user;
  final List<ClientProductResponse>? products;
  final List<OrderResponse>? orders;
  final String createdAt;

  ClientEntity({
    required this.id,
    required this.user,
    required this.products,
    required this.orders,
    required this.createdAt,
  });
}
