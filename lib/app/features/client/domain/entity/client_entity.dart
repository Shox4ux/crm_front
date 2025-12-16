import 'package:crm_app/app/features/user/domain/entity/user_entity.dart';
import 'package:crm_app/app/features/client/data/model/client_product_response.dart';
import 'package:crm_app/app/src/data/remote/models/response/order/order_read.dart';

class ClientEntity {
  final int id;
  final UserEntity user;
  final List<ClientProductRead>? products;
  final List<OrderRead>? orders;
  final String createdAt;

  ClientEntity({
    required this.id,
    required this.user,
    required this.products,
    required this.orders,
    required this.createdAt,
  });
}
