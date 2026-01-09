import 'package:json_annotation/json_annotation.dart';

part 'client_prod_update.g.dart';

@JsonSerializable()
class ClientProdUpdate {
  final double? customPrice;
  ClientProdUpdate({this.customPrice});

  Map<String, dynamic> toJson() => _$ClientProdUpdateToJson(this);

  factory ClientProdUpdate.fromJson(Map<String, dynamic> map) =>
      _$ClientProdUpdateFromJson(map);
}
