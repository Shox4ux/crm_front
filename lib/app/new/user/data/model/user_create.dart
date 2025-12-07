import 'package:json_annotation/json_annotation.dart';

part 'user_create.g.dart';

@JsonSerializable()
class UserCreate {
  final String? username;
  final String? password;
  final String? hashedPassword;
  final int? role;

  UserCreate({
    required this.username,
    required this.password,
    required this.hashedPassword,
    required this.role,
  });

  Map<String, dynamic> toMap() => _$UserCreateToJson(this);
  Map<String, dynamic> toJson() => _$UserCreateToJson(this);

  factory UserCreate.fromMap(Map<String, dynamic> map) =>
      _$UserCreateFromJson(map);

  factory UserCreate.fromJson(Map<String, dynamic> source) =>
      UserCreate.fromMap(source);
}
