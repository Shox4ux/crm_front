import 'package:json_annotation/json_annotation.dart';

part 'del_read.g.dart';

@JsonSerializable()
class DelRead {
  final String message;

  DelRead({required this.message});

  Map<String, dynamic> toJson() => _$DelReadToJson(this);

  factory DelRead.fromJson(Map<String, dynamic> map) => _$DelReadFromJson(map);

  Map<String, dynamic> toMap() => _$DelReadToJson(this);

  factory DelRead.fromMap(Map<String, dynamic> map) => _$DelReadFromJson(map);
}
