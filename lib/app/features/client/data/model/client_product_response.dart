import 'package:crm_app/app/src/data/remote/models/response/product/product_read.dart';
import 'package:json_annotation/json_annotation.dart';
part 'client_product_response.g.dart';

@JsonSerializable()
class ClientProductRead {
  final int id;
  final double customPrice;
  final ProductRead? product;
  final DateTime createdAt;
  ClientProductRead({
    required this.id,
    required this.customPrice,
    this.product,
    required this.createdAt,
  });

  Map<String, dynamic> toJson() => _$ClientProductReadToJson(this);

  factory ClientProductRead.fromJson(Map<String, dynamic> map) =>
      _$ClientProductReadFromJson(map);

  Map<String, dynamic> toMap() => _$ClientProductReadToJson(this);

  factory ClientProductRead.fromMap(Map<String, dynamic> map) =>
      _$ClientProductReadFromJson(map);
}
