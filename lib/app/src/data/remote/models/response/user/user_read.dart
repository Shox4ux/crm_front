// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:json_annotation/json_annotation.dart';

part 'user_read.g.dart';

@JsonSerializable()
class UserRead {
  final int id;
  final String username;
  final String password;
  final int role;
  final DateTime createdAt;
  UserRead({
    required this.id,
    required this.username,
    required this.password,
    required this.role,
    required this.createdAt,
  });

  Map<String, dynamic> toJson() => _$UserReadToJson(this);

  factory UserRead.fromJson(Map<String, dynamic> map) =>
      _$UserReadFromJson(map);

  Map<String, dynamic> toMap() => _$UserReadToJson(this);

  factory UserRead.fromMap(Map<String, dynamic> map) => _$UserReadFromJson(map);
}
