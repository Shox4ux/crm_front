// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:json_annotation/json_annotation.dart';

part 'user_write.g.dart';

@JsonSerializable()
class UserWrite {
  final String username;
  final String password;
  final String? hashedPassword;
  final int role;
  UserWrite({
    required this.username,
    required this.password,
    this.hashedPassword,
    required this.role,
  });

  Map<String, dynamic> toMap() => _$UserWriteToJson(this);
  Map<String, dynamic> toJson() => _$UserWriteToJson(this);

  factory UserWrite.fromMap(Map<String, dynamic> map) =>
      _$UserWriteFromJson(map);

  factory UserWrite.fromJson(Map<String, dynamic> source) =>
      UserWrite.fromMap(source);
}
