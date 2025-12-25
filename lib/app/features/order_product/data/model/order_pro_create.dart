import 'package:json_annotation/json_annotation.dart';
part 'order_pro_create.g.dart';

@JsonSerializable()
class OrderProCreate {
  final num customPrice;
  final num customQuantity;
  final int warehouseProductId;
  OrderProCreate({
    required this.customPrice,
    required this.customQuantity,
    required this.warehouseProductId,
  });

  Map<String, dynamic> toJson() => _$OrderProCreateToJson(this);

  factory OrderProCreate.fromJson(Map<String, dynamic> map) =>
      _$OrderProCreateFromJson(map);
}
