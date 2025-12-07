import 'package:json_annotation/json_annotation.dart';

part 'login_request.g.dart';

@JsonSerializable()
class LoginRequest {
  final int role;
  final String username;
  final String password;

  LoginRequest({
    required this.role,
    required this.username,
    required this.password,
  });

  Map<String, dynamic> toMap() => _$LoginRequestToJson(this);
  Map<String, dynamic> toJson() => _$LoginRequestToJson(this);

  factory LoginRequest.fromMap(Map<String, dynamic> map) =>
      _$LoginRequestFromJson(map);

  factory LoginRequest.fromJson(Map<String, dynamic> source) =>
      LoginRequest.fromMap(source);
}
