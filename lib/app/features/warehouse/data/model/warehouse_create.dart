import 'package:json_annotation/json_annotation.dart';
part 'warehouse_create.g.dart';

@JsonSerializable()
class WarehouseCreate {
  final String name;
  final String address;
  WarehouseCreate({required this.name, required this.address});

  Map<String, dynamic> toMap() => _$WarehouseCreateToJson(this);

  factory WarehouseCreate.fromMap(Map<String, dynamic> map) =>
      _$WarehouseCreateFromJson(map);
}
