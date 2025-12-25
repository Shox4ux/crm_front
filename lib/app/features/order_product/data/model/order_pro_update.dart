import 'package:json_annotation/json_annotation.dart';
part 'order_pro_update.g.dart';

@JsonSerializable()
class OrderProUpdate {
  final num customQuantity;
  final num customPrice;

  OrderProUpdate({required this.customQuantity, required this.customPrice});

  Map<String, dynamic> toJson() => _$OrderProUpdateToJson(this);
  factory OrderProUpdate.fromMap(Map<String, dynamic> map) =>
      _$OrderProUpdateFromJson(map);
}
