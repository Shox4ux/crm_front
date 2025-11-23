import 'package:json_annotation/json_annotation.dart';
part 'auth_read.g.dart';

@JsonSerializable()
class AuthRead {
  final String accessToken;
  final String tokenType;
  final DateTime expiresAt;
  AuthRead({
    required this.accessToken,
    required this.tokenType,
    required this.expiresAt,
  });

  Map<String, dynamic> toMap() => _$AuthReadToJson(this);

  factory AuthRead.fromMap(Map<String, dynamic> map) => _$AuthReadFromJson(map);

  Map<String, dynamic> toJson() => _$AuthReadToJson(this);

  factory AuthRead.fromJson(Map<String, dynamic> map) =>
      _$AuthReadFromJson(map);
}
