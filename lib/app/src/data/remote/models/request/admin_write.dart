import 'package:json_annotation/json_annotation.dart';

part 'admin_write.g.dart';

@JsonSerializable()
class AdminRequestModel {
  final int userId;
  final int permission;

  AdminRequestModel({required this.userId, required this.permission});

  Map<String, dynamic> toMap() => _$AdminRequestModelToJson(this);
  Map<String, dynamic> toJson() => _$AdminRequestModelToJson(this);

  factory AdminRequestModel.fromMap(Map<String, dynamic> map) =>
      _$AdminRequestModelFromJson(map);

  factory AdminRequestModel.fromJson(Map<String, dynamic> source) =>
      AdminRequestModel.fromMap(source);
}
