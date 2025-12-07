import 'package:crm_app/app/new/user/domain/entity/user_entity.dart';
import 'package:crm_app/app/new/client/data/model/client_product_response.dart';
import 'package:crm_app/app/src/data/remote/models/response/order/order_read.dart';

class ClientEntity {
  final int id;
  final String phone;
  final String address;
  final UserEntity user;
  final List<ClientProductRead>? products;
  final List<OrderRead>? orders;
  final DateTime createdAt;

  ClientEntity({
    required this.id,
    required this.phone,
    required this.address,
    required this.user,
    required this.products,
    required this.orders,
    required this.createdAt,
  });
}
