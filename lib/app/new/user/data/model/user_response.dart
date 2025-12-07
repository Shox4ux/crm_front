// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:crm_app/app/new/user/domain/entity/user_entity.dart';
import 'package:json_annotation/json_annotation.dart';

part 'user_response.g.dart';

@JsonSerializable()
class UserResponse extends UserEntity {
  final int id;
  final String username;
  final String password;
  final String? hashedPassword;
  final bool isActive;
  final DateTime createdAt;
  UserResponse({
    required this.id,
    required this.username,
    required this.password,
    this.hashedPassword,
    required this.isActive,
    required this.createdAt,
  }) : super(
         id: id,
         username: username,
         password: password,
         hashedPassword: hashedPassword,
         isActive: isActive,
         createdAt: createdAt,
       );

  Map<String, dynamic> toJson() => _$UserResponseToJson(this);

  factory UserResponse.fromJson(Map<String, dynamic> map) =>
      _$UserResponseFromJson(map);

  Map<String, dynamic> toMap() => _$UserResponseToJson(this);

  factory UserResponse.fromMap(Map<String, dynamic> map) =>
      _$UserResponseFromJson(map);
}
