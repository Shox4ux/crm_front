import 'dart:convert';

import 'package:json_annotation/json_annotation.dart';

part 'client_update.g.dart';

@JsonSerializable()
class ClientUpdate {
  final String? phone;
  final String? address;
  ClientUpdate({this.phone, this.address});

  Map<String, dynamic> toMap() => _$ClientUpdateToJson(this);

  factory ClientUpdate.fromMap(Map<String, dynamic> map) =>
      _$ClientUpdateFromJson(map);

  String toJson() => json.encode(toMap());

  factory ClientUpdate.fromJson(String source) =>
      ClientUpdate.fromMap(json.decode(source) as Map<String, dynamic>);
}
