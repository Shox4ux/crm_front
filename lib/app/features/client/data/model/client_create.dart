// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:json_annotation/json_annotation.dart';

part 'client_create.g.dart';

@JsonSerializable()
class ClientCreate {
  final int? userId;
  final String? phone;
  final String? address;

  ClientCreate({this.userId, this.phone, this.address});

  Map<String, dynamic> toMap() => _$ClientCreateToJson(this);

  factory ClientCreate.fromMap(Map<String, dynamic> map) =>
      _$ClientCreateFromJson(map);

  String toJson() => json.encode(toMap());

  factory ClientCreate.fromJson(String source) =>
      ClientCreate.fromMap(json.decode(source) as Map<String, dynamic>);

  ClientCreate copyWith({int? userId, String? phone, String? address}) {
    return ClientCreate(
      userId: userId ?? this.userId,
      phone: phone ?? this.phone,
      address: address ?? this.address,
    );
  }
}
