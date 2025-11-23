// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:json_annotation/json_annotation.dart';

part 'auth_write.g.dart';

@JsonSerializable()
class AuthWrite {
  final int role;
  final String username;
  final String password;
  AuthWrite({
    required this.role,
    required this.username,
    required this.password,
  });

  Map<String, dynamic> toMap() => _$AuthWriteToJson(this);

  factory AuthWrite.fromMap(Map<String, dynamic> map) =>
      _$AuthWriteFromJson(map);

  String toJson() => json.encode(toMap());

  factory AuthWrite.fromJson(String source) =>
      AuthWrite.fromMap(json.decode(source) as Map<String, dynamic>);
}
