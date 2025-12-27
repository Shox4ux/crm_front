import 'package:json_annotation/json_annotation.dart';
part 'warehouse_create.g.dart';

@JsonSerializable()
class WarehouseCreate {
  final String name;
  final String address;
  WarehouseCreate({required this.name, required this.address});

  Map<String, dynamic> toJson() => _$WarehouseCreateToJson(this);

  factory WarehouseCreate.fromJson(Map<String, dynamic> map) =>
      _$WarehouseCreateFromJson(map);
}
