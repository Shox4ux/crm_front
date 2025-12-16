import 'package:crm_app/app/features/user/domain/entity/user_entity.dart';
import 'package:json_annotation/json_annotation.dart';

part 'user_response.g.dart';

@JsonSerializable()
class UserResponse extends UserEntity {
  const UserResponse({
    int? id,
    String? username,
    int? role,
    String? img,
    String? phone,
    bool? isActive,
    String? address,
    DateTime? createdAt,
  }) : super(
         id: id,
         username: username,
         role: role,
         img: img,
         phone: phone,
         isActive: isActive,
         address: address,
         createdAt: createdAt,
       );

  Map<String, dynamic> toJson() => _$UserResponseToJson(this);

  factory UserResponse.fromJson(Map<String, dynamic> map) =>
      _$UserResponseFromJson(map);

  Map<String, dynamic> toMap() => _$UserResponseToJson(this);

  factory UserResponse.fromMap(Map<String, dynamic> map) =>
      _$UserResponseFromJson(map);
}
