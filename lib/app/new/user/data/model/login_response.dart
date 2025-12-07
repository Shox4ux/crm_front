import 'package:json_annotation/json_annotation.dart';

part 'login_response.g.dart';

@JsonSerializable()
class LoginResponse {
  final String accessToken;
  final String tokenType;
  final String expiresAt;

  LoginResponse({
    required this.accessToken,
    required this.tokenType,
    required this.expiresAt,
  });

  Map<String, dynamic> toMap() => _$LoginResponseToJson(this);
  Map<String, dynamic> toJson() => _$LoginResponseToJson(this);

  factory LoginResponse.fromMap(Map<String, dynamic> map) =>
      _$LoginResponseFromJson(map);

  factory LoginResponse.fromJson(Map<String, dynamic> source) =>
      LoginResponse.fromMap(source);
}
