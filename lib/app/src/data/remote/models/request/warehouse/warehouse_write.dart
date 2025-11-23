import 'dart:convert';

import 'package:json_annotation/json_annotation.dart';

part 'warehouse_write.g.dart';

@JsonSerializable()
class WarehouseWrite {
  final String name;
  final String address;
  WarehouseWrite({required this.name, required this.address});

  Map<String, dynamic> toMap() => _$WarehouseWriteToJson(this);

  factory WarehouseWrite.fromMap(Map<String, dynamic> map) =>
      _$WarehouseWriteFromJson(map);

  String toJson() => json.encode(toMap());

  factory WarehouseWrite.fromJson(String source) =>
      WarehouseWrite.fromMap(json.decode(source) as Map<String, dynamic>);
}
