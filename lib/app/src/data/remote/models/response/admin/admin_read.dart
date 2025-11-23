import '../user/user_read.dart';
import 'package:json_annotation/json_annotation.dart';

part 'admin_read.g.dart';

@JsonSerializable()
class AdminRead {
  final int id;
  final int userId;
  final int permission;
  final UserRead user;
  final DateTime createdAt;

  AdminRead({
    required this.id,
    required this.userId,
    required this.permission,
    required this.user,
    required this.createdAt,
  });

  Map<String, dynamic> toJson() => _$AdminReadToJson(this);

  factory AdminRead.fromJson(Map<String, dynamic> map) =>
      _$AdminReadFromJson(map);

  Map<String, dynamic> toMap() => _$AdminReadToJson(this);

  factory AdminRead.fromMap(Map<String, dynamic> map) =>
      _$AdminReadFromJson(map);
}
