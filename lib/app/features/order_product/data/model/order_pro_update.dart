import 'package:json_annotation/json_annotation.dart';
part 'order_pro_update.g.dart';

@JsonSerializable()
class OrderProUpdate {
  final int id;
  final int warehouseProductId;
  final num customQuantity;
  final num customPrice;

  OrderProUpdate({
    required this.customQuantity,
    required this.customPrice,
    required this.id,
    required this.warehouseProductId,
  });

  Map<String, dynamic> toJson() => _$OrderProUpdateToJson(this);
  factory OrderProUpdate.fromJson(Map<String, dynamic> map) =>
      _$OrderProUpdateFromJson(map);
}
