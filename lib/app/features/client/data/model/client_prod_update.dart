// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:json_annotation/json_annotation.dart';

part 'client_prod_update.g.dart';

@JsonSerializable()
class ClientProdUpdate {
  final double? customPrice;
  ClientProdUpdate({this.customPrice});

  Map<String, dynamic> toMap() => _$ClientProdUpdateToJson(this);

  factory ClientProdUpdate.fromMap(Map<String, dynamic> map) =>
      _$ClientProdUpdateFromJson(map);

  String toJson() => json.encode(toMap());

  factory ClientProdUpdate.fromJson(String source) =>
      ClientProdUpdate.fromMap(json.decode(source) as Map<String, dynamic>);
}
