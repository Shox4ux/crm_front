// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:json_annotation/json_annotation.dart';

part 'client_write.g.dart';

@JsonSerializable()
class ClientWrite {
  final int? userId;
  final String? phone;
  final String? address;

  ClientWrite({this.userId, this.phone, this.address});

  Map<String, dynamic> toMap() => _$ClientWriteToJson(this);

  factory ClientWrite.fromMap(Map<String, dynamic> map) =>
      _$ClientWriteFromJson(map);

  String toJson() => json.encode(toMap());

  factory ClientWrite.fromJson(String source) =>
      ClientWrite.fromMap(json.decode(source) as Map<String, dynamic>);

  ClientWrite copyWith({int? userId, String? phone, String? address}) {
    return ClientWrite(
      userId: userId ?? this.userId,
      phone: phone ?? this.phone,
      address: address ?? this.address,
    );
  }
}
