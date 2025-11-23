// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:json_annotation/json_annotation.dart';

part 'user_update.g.dart';

@JsonSerializable()
class UserUpdate {
  final bool? isActive;
  final String? password;
  final String? hashedPassword;
  UserUpdate({this.isActive, this.password, this.hashedPassword});

  Map<String, dynamic> toMap() => _$UserUpdateToJson(this);

  factory UserUpdate.fromMap(Map<String, dynamic> map) =>
      _$UserUpdateFromJson(map);

  String toJson() => json.encode(toMap());

  factory UserUpdate.fromJson(String source) =>
      UserUpdate.fromMap(json.decode(source) as Map<String, dynamic>);
}
