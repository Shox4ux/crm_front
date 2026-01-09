import 'package:json_annotation/json_annotation.dart';
part 'warehouse_create_update.g.dart';

@JsonSerializable()
class WarehouseCreateUpdate {
  final String name;
  final String address;
  WarehouseCreateUpdate({required this.name, required this.address});

  Map<String, dynamic> toJson() => _$WarehouseCreateUpdateToJson(this);

  factory WarehouseCreateUpdate.fromJson(Map<String, dynamic> map) =>
      _$WarehouseCreateUpdateFromJson(map);
}
