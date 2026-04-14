import 'package:crm_app/app/features/user/data/model/user_response.dart';
import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';
part 'admin_response.g.dart';

@JsonSerializable()
class AdminResponse extends Equatable {
  final int id;
  final int permission;
  final UserResponse user;
  final DateTime createdAt;

  const AdminResponse({
    required this.id,
    required this.permission,
    required this.user,
    required this.createdAt,
  });

  Map<String, dynamic> toJson() => _$AdminResponseToJson(this);
  factory AdminResponse.fromJson(Map<String, dynamic> map) =>
      _$AdminResponseFromJson(map);
  @override
  List<Object?> get props => [id];
}
