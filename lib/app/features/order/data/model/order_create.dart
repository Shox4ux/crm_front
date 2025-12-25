import 'package:json_annotation/json_annotation.dart';
part 'order_create.g.dart';

@JsonSerializable()
class OrderCreate {
  final int clientId;
  final int status;
  final double paidAmount;
  final String? adminNote;
  final String? clientNote;
  OrderCreate({
    required this.clientId,
    required this.status,
    required this.paidAmount,
    this.adminNote,
    this.clientNote,
  });

  Map<String, dynamic> toJson() => _$OrderCreateToJson(this);

  factory OrderCreate.fromJson(Map<String, dynamic> map) =>
      _$OrderCreateFromJson(map);
}
