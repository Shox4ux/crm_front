import 'package:crm_app/app/src/models/order_product_model.dart';

class Client {
  final int? id;
  final String? fullName;
  final String? phone;
  final String? address;
  final List<OrderProduct>? salesList;
  final DateTime? createdAt;

  Client({
    this.id,
    required this.fullName,
    required this.phone,
    this.address,
    this.salesList,
    this.createdAt,
  });

  factory Client.fake({
    String? fullName,
    String? phone,
    List<OrderProduct>? list,
  }) => Client(fullName: fullName, phone: phone, salesList: list);
}

List<Client> clientList = [
  Client.fake(fullName: "Abror Axmedov", phone: "1234546", list: salesList),
  Client.fake(fullName: "Abror_1 Axmedov", phone: "1234546", list: salesList),
  Client.fake(fullName: "Abror_2 Axmedov", phone: "1234546", list: salesList),
  Client.fake(fullName: "Abror_3 Axmedov", phone: "1234546", list: salesList),
  Client.fake(fullName: "Abror_4 Axmedov", phone: "1234546", list: salesList),
];
