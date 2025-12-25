import 'package:crm_app/app/features/user/domain/entity/user_entity.dart';
import 'package:json_annotation/json_annotation.dart';

part 'user_response.g.dart';

@JsonSerializable()
class UserResponse extends UserEntity {
  const UserResponse({
    super.id,
    super.username,
    super.role,
    super.img,
    super.phone,
    super.isActive,
    super.address,
    super.createdAt,
  });

  Map<String, dynamic> toJson() => _$UserResponseToJson(this);

  factory UserResponse.fromJson(Map<String, dynamic> map) =>
      _$UserResponseFromJson(map);

  Map<String, dynamic> toMap() => _$UserResponseToJson(this);

  factory UserResponse.fromMap(Map<String, dynamic> map) =>
      _$UserResponseFromJson(map);
}
