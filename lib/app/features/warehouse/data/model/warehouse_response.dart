import 'package:crm_app/app/features/warehouse/domain/entity/warehouse_entity.dart';
import 'package:crm_app/app/features/warehouse_prod/data/model/ware_pro_response.dart';
import 'package:json_annotation/json_annotation.dart';
part 'warehouse_response.g.dart';

@JsonSerializable()
class WarehouseResponse extends WarehouseEntity {
  WarehouseResponse({
    required super.id,
    required super.name,
    required super.address,
    required super.products,
    required super.createdAt,
  });

  Map<String, dynamic> toJson() => _$WarehouseResponseToJson(this);

  factory WarehouseResponse.fromJson(Map<String, dynamic> map) =>
      _$WarehouseResponseFromJson(map);
}
