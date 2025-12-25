import 'package:crm_app/app/features/product/data/model/product_response.dart';
import 'package:json_annotation/json_annotation.dart';
part 'client_product_response.g.dart';

@JsonSerializable()
class ClientProductResponse {
  final int id;
  final double customPrice;
  final ProductResponse? product;
  final DateTime createdAt;
  ClientProductResponse({
    required this.id,
    required this.customPrice,
    this.product,
    required this.createdAt,
  });

  Map<String, dynamic> toJson() => _$ClientProductResponseToJson(this);

  factory ClientProductResponse.fromJson(Map<String, dynamic> map) =>
      _$ClientProductResponseFromJson(map);

  Map<String, dynamic> toMap() => _$ClientProductResponseToJson(this);

  factory ClientProductResponse.fromMap(Map<String, dynamic> map) =>
      _$ClientProductResponseFromJson(map);
}
