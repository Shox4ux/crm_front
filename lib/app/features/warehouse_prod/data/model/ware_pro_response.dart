import 'package:crm_app/app/features/product/data/model/product_response.dart';
import 'package:crm_app/app/features/warehouse_prod/domain/entity/ware_pro_entitiy.dart';
import 'package:json_annotation/json_annotation.dart';
part 'ware_pro_response.g.dart';

@JsonSerializable()
class WareProResponse extends WareProEntitiy {
  WareProResponse({
    required super.id,
    required super.product,
    required super.warehouseId,
    required super.status,
    required super.arrivesAt,
    required super.quantity,
  });
  Map<String, dynamic> toJson() => _$WareProResponseToJson(this);
  factory WareProResponse.fromJson(Map<String, dynamic> map) =>
      _$WareProResponseFromJson(map);
}
