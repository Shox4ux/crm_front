import 'package:json_annotation/json_annotation.dart';
part 'ware_pro_create.g.dart';

@JsonSerializable()
class WareProCreate {
  final int warehouseId;
  final int productId;
  final int status;
  final int quantity;
  WareProCreate({
    required this.warehouseId,
    required this.productId,
    required this.status,
    required this.quantity,
  });
  Map<String, dynamic> toJson() => _$WareProCreateToJson(this);

  factory WareProCreate.fromJson(Map<String, dynamic> map) =>
      _$WareProCreateFromJson(map);
}
