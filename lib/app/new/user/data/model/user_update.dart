import 'package:json_annotation/json_annotation.dart';
part 'user_update.g.dart';

@JsonSerializable()
class UserUpdate {
  final bool? isActive;
  final String? password;
  final String? hashedPassword;
  UserUpdate({this.isActive, this.password, this.hashedPassword});

  Map<String, dynamic> toMap() => _$UserUpdateToJson(this);

  factory UserUpdate.fromMap(Map<String, dynamic> map) =>
      _$UserUpdateFromJson(map);
}
